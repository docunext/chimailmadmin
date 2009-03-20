/* Color Matrix Library : v1.0 : 2007/04/19 */
/* http://www.nofunc.com/Color_Matrix_Library/ */

new function(_) {

$lut=''; $m=''; $c='';

var $L={'R':0.212671, 'G':0.715160, 'B':0.072169};

var $color=[1,0,0,0,0, 0,1,0,0,0, 0,0,1,0,0, 0,0,0,1,0, 0,0,0,0,1];

var $w, $h, $stop;


/* CANVAS MATRIX */

_cMatrix={

	/* Color */
	
	'Hue':function(v) { v*=Math.PI/180; // 0 : 360
	
		var r=$L.R, g=$L.G, b=$L.B, c=Math.cos(v), s=Math.sin(v);

		return([(r+(c*(1-r)))+(s*(-r)), (g+(c*(-g)))+(s*(-g)), (b+(c*(-b)))+(s*(1-b)), 0, 0,
				(r+(c*(-r)))+(s*0.143), (g+(c*(1-g)))+(s*0.14), (b+(c*(-b)))+(s*-0.283), 0, 0,
				(r+(c*(-r)))+(s*(-(1-r))), (g+(c*(-g)))+(s*g), (b+(c*(1-b)))+(s*b), 0, 0,
				0,0,0,1,0,  0,0,0,0,1]);

	},
	'Saturation':function(v) { var n=1-v; // -3 : 3

		var r=(n*.299), g=(n*.587), b=(n*.114);

		return([r+v,g,b,0,0,  r,g+v,b,0,0,  r,g,b+v,0,0,  0,0,0,1,0,  0,0,0,0,1]);

	},
	'Brightness':function(v) { // -255 : 255

		return([1,0,0,0,v,  0,1,0,0,v,  0,0,1,0,v,  0,0,0,1,0,  0,0,0,0,1]);
	
	},
	'Contrast':function(v) { // -2 : 5

		return([v,0,0,0,128*(1-v),  0,v,0,0,128*(1-v),  0,0,v,0,128*(1-v),  0,0,0,1,0,  0,0,0,0,1]);
	
	},
	'Exposure':function(v) { // -3 : 3
	
		return([v,0,0,0,0,  0,v,0,0,0,  0,0,v,0,0,  0,0,0,1,0,  0,0,0,0,1]);

	},
	'Enhance':function(threshold,n) { n=1;

		if(threshold==0) { var max=[255,255,255], min=[0,0,0]; }

		else { var max=histo.getMax3(threshold), min=histo.getMin3(threshold); }
	
		var R=255/(max[0]-min[0])*n, G=255/(max[1]-min[1])*n, B=255/(max[2]-min[2])*n;

		return([R,0,0,0,-min[0],  0,G,0,0,-min[1],  0,0,B,0,-min[2],  0,0,0,1,0,  0,0,0,0,1]);

	},
	'Temperature':function(v) { var r=v, g=v, b=-v; // -128 : 128

		return([1+(r/256),0,0,0,0,  0,1,0,0,0,  0,0,1+(b/256),0,0,  0,0,0,1,0,  0,0,0,0,1]);

	},
	'Tint':function(v) { var r=v, g=-v, b=v; // -128 : 128

		return([1+(r/256),0,0,0,0,  0,1,0,0,0,  0,0,1+(b/256),0,0,  0,0,0,1,0,  0,0,0,0,1]);

	},
	'Alpha':function(v) { // 0 : 1
	
		return([1,0,0,0,0,  0,1,0,0,0,  0,0,1,0,0,  0,0,0,v,0,  0,0,0,0,1]);
	
	},
	'Channels':function(r,g,b,a) {
	
		function fu(n) { var z=((r&1)==1?1:0)+((r&2)==2?1:0)+((r&4)==4?1:0)+((r&8)==8?1:0); return(z>0?1/z:z); }
	
		var R=fu(r), G=fu(g), B=fu(b), A=fu(a);
		
		return([(r&1)==1?R:0,(r&2)==2?R:0,(r&4)==4?R:0,(r&8)==8?R:0,0,
				(g&1)==1?G:0,(g&2)==2?G:0,(g&4)==4?G:0,(g&8)==8?G:0,0,
				(b&1)==1?B:0,(b&2)==2?B:0,(b&4)==4?B:0,(b&8)==8?B:0,0,
				(a&1)==1?A:0,(a&2)==2?A:0,(a&4)==4?A:0,(a&8)==8?A:0,0]);

	},
	'Blind':function(v) {

		return({'Normal':[1,0,0,0,0, 0,1,0,0,0, 0,0,1,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Protanopia':[0.567,0.433,0,0,0, 0.558,0.442,0,0,0, 0,0.242,0.758,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Protanomaly':[0.817,0.183,0,0,0, 0.333,0.667,0,0,0, 0,0.125,0.875,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Deuteranopia':[0.625,0.375,0,0,0, 0.7,0.3,0,0,0, 0,0.3,0.7,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Deuteranomaly':[0.8,0.2,0,0,0, 0.258,0.742,0,0,0, 0,0.142,0.858,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Tritanopia':[0.95,0.05,0,0,0, 0,0.433,0.567,0,0, 0,0.475,0.525,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Tritanomaly':[0.967,0.033,0,0,0, 0,0.733,0.267,0,0, 0,0.183,0.817,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Achromatopsia':[0.299,0.587,0.114,0,0, 0.299,0.587,0.114,0,0, 0.299,0.587,0.114,0,0, 0,0,0,1,0, 0,0,0,0,1],
				'Achromatomaly':[0.618,0.320,0.062,0,0, 0.163,0.775,0.062,0,0, 0.163,0.320,0.516,0,0,0,0,0,1,0,0,0,0,0]}[v]);

	},	
	'Colorize':function(v,n) { // 0xFFFFFF, 0 : 1

		var r=((v>>16)&0xFF)/255, g=((v>>8)&0xFF)/255, b=(v&0xFF)/255, o=$L;
	
		return([(1-n)+n*r*o.R,n*r*o.G,n*r*o.B,0,0,  n*g*o.R,(1-n)+n*g*o.G,n*g*o.B,0,0,  n*b*o.R,n*b*o.G,(1-n)+n*b*o.B,0,0,  0,0,0,1,0,  
0,0,0,0,1]);

	},
	'Threshold':function(v) { var o=$L; // 0 : 255

		return([o.R*256,o.G*256,o.B*256,0,-256*v,  o.R*256,o.G*256,o.B*256,0,-256*v,  o.R*256,o.G*256,o.B*256,0,-256*v,  0,0,0,1,0,  
0,0,0,0,1]);
	
	},
	'Invert':function(v) { // 0 : 1

		return([-1,0,0,0,255, 0,-1,0,0,255, 0,0,-1,0,255, 0,0,0,1,0, 0,0,0,0,1]);
	
	},


	'Gamma':function(R,G,B) { var z=[]; // 0 : 1

		for(var i=0; i<256; i++) {

			z[i]=Math.min(255,((255*Math.pow(i/255,1/R))+0.5));
			z[256+i]=Math.min(255,((255*Math.pow(i/255,1/G))+0.5));
			z[512+i]=Math.min(255,((255*Math.pow(i/255,1/B))+0.5));
	
		};
	
		return(z);

	},

	/* Convolution */

	'Emboss':function(v) { // 0 : 360

		var r=(v/360*Math.PI)*2, dr=Math.PI/4, cos=Math.cos;

		return([[cos(r+dr),cos(r+2*dr),cos(r+3*dr), cos(r),0,cos(r+4*dr), cos(r-dr),cos(r-2*dr),cos(r-3*dr)], 1, 128]);

	},
	'EdgeDetect':function(v) { // 0 : 360

		var r=(v/360*Math.PI)*2, dr=Math.PI/4, cos=Math.cos;

		return([[cos(r+dr),cos(r+2*dr),cos(r+3*dr), cos(r),0,cos(r+4*dr), cos(r-dr),cos(r-2*dr),cos(r-3*dr)], 1, 0]);

	},
	'Gaussian':function(v) {

		var size=1+(v*2), center=size/2, max=0, M=[size];
		
		for(var i=0; i<size; ++i) {
		
			for(var j=0; j<size; ++j) {

				M[(i*size)+j]=(16*Math.sqrt(((j-center)*(j-center))+((i-center)*(i-center))));

			}
		};

		for(var i=0; i<size; ++i) {

			for(var j=0; j<size; ++j) {
			
				if(M[(i*size)+j]>max) { max=M[(i*size)+j]; }

			}
		};
		
		for(var i=0; i<size; ++i) { 
		
			for(var j=0; j<size; ++j) {
			
				M[(i*size)+j]=(max-M[(i*size)+j])/128;
				
			}
		};

		return([M, 1, 0]);
	
	},
	'Relief':function(v) { // 0 : 360

		var r=(v/360*Math.PI)*2, dr=Math.PI/4, cos=Math.cos;

		return([[cos(r+dr),cos(r+2*dr),cos(r+3*dr), cos(r),1,cos(r+4*dr), cos(r-dr),cos(r-2*dr),cos(r-3*dr)], 1, 0]);

	},
	'Sharpness':function(v) {

		return([[-v,-v,-v,  -v,8*v+1,-v,  -v,-v,-v], 1, 0]);

	},
	
	/* Geometry */
	
	'Rotate':function(v) {
	
		return([Math.cos(v),Math.sin(v),0,-Math.sin(v),Math.cos(v),0]);
	
	},

	/* Combine Effects */
	
	'blend':function(a,b,n) { var z=[], len=a.length; b=b?b:$color;

		for(var i=0; i<len; i++) { z[i]=(1-n)*a[i]+n*b[i]; }

		return(z);

	},
	'concat':function(r) { var z;

		for(var i in r) { if(!z) { z=r[i]; continue; }; z=_cMatrix.multiply(z,r[i]); };
		
		return(z);

	},	
	'multiply':function(a,b) { var z=[], i=0, n=5;

		for(var x=0; x<n; x++) {
	
			for(var y=0; y<n; y++) { z[i+y]=0;

				for(var j=0; j<n; j++) { z[i+y]+=a[i+j]*b[y+(j*n)]; };
	
			}; i+=n;
		}

		return(z);
	
	}
};




/* Color Matrix */

setColorMatrix=function(m) { $m=m; };

ColorMatrix=function(o,w,h) {

	if(!$stop && $m) { $stop=1;
	
		var data=o.data, i, x, y;

		var m=$m, m0=m[0], m1=m[1], m2=m[2], m3=m[3], m4=m[4], m5=m[5], m6=m[6], m7=m[7], m8=m[8], m9=m[9], m10=m[10], m11=m[11], m12=m[12], 
m13=m[13], m14=m[14], m15=m[15], m16=m[16], m17=m[17], m18=m[18], m19=m[19], m20=m[20], m21=m[21], m22=m[22], m23=m[23], m24=m[24];
	
		var r, g, b, a, _r, _g, _b, _a;
	
		for(x=0; x<w; x++) {
	
			for(y=0; y<h; y++) { i=(w*y+x)*4;
	
				r=data[i]; g=data[i+1]; b=data[i+2]; a=data[i+3];
	
				_r=((r*m0)+(g*m1)+(b*m2)+(a*m3)+(m4));
				_g=((r*m5)+(g*m6)+(b*m7)+(a*m8)+(m9));
				_b=((r*m10)+(g*m11)+(b*m12)+(a*m13)+(m14));
				_a=((r*m15)+(g*m16)+(b*m17)+(a*m18)+(m19));
	
				data[i]=(_r<0?0:(_r<255?_r:255));
				data[i+1]=(_g<0?0:(_g<255?_g:255));
				data[i+2]=(_b<0?0:(_b<255?_b:255));
				data[i+3]=(_a<0?0:(_a<255?_a:255));
	
			}
		};
		
		o.data=data;
	
		var c=document.getElementById('canvas_c').getContext('2d'); c.clearRect(0,0,w,h); c.putImageData(o,0,0);
	

	};
	
	$stop=0;
	
};
};

