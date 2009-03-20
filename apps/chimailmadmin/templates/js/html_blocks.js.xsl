<!--
Program: PhunkyBB
Component: html_footer.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
	<xsl:template match="/">
			<![CDATA[
			var myincr = 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ7SURBVDjLpZNNbxJRFIb7A/wF/A5YunRDovEjalEXJm5M2Ji4aFoTI6kxjcVaCGOJYtq0NlBJ0AS0tcbWSkeQhhQopQwfAhYotAwIAwPDUI5zLh9SdedN3kzmznmfc86dc4cAYGhQZ2ZAJkkhSSlJ1ZWyuyf7M37QeEqSfOxNWW37uk+5fVF6Z3ePDQRD7KY3TL/eSFAj1qIaYzD2BKBrPm1xZjWBvTiTK5SB45sgHreJKjUBMvkiuLxBZnY1rsHYHqQHkKM5GP7O1Rsi4OKFFhS5JrCSqo0W2eN4ATY9fs60HEGInACwLywbM/fMR2UB9gt1yJUEomypAYk834esrruYO4s5bEeGAIWN/kFh2YNmldZ7wjw8uUX2cYUTB2Cwuin0IkDp2o7Q2DOWmjqqw6WHTgLIFBsQz/Fw7p6DAPBbuSbCYYmHuSUHjV4EqPw7uyweVv6nABfHP0vaIAbMfHbMLskBVx97yDtWIYjHsGheYtFLAL5AkAAKlSZcm/LDhQefCACBlx/RcP7+B7gy4SbVdKpowtz8qz5A+WUrRJe4BlR4EdKs1P8Tn9TCNiQPOwaEDU96IXZQI38mmi6BwWTut6Awr8WoVKYA7TYQA5Z5YzpAMqKw9OtP/RDJ1KDZasP6txBojO/7hyi7azlSrzk9DFvunDKaMDtmjGZrxIhPTBCTsuufLzC3jNHOb+wNkuFtQGP/6ORyxSoJLFVFUg2CcJgwczRdBJ3Jwo0aln8P0uAoa80ezYLVzrj9MUjlyuRMsOdQkoUVZwC0hllmRP/u71EevEy3XybV4y9WqKmZedrwzMhO6yl2QmeiR3U26iYV/vdl+p/r/AvMhAk86cw6LgAAAABJRU5ErkJggg==';
			var myskip = 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJiSURBVDjLpZNLbxJRFMf7AfwEfA5YunTDwsTuujO+YsLGxEVTV066cdGYQmaAKKZNawOVSE2qltRIW+kI0jQWOlCGh0Bb6FAYcBgYGKAc51wegrrzJv9k5ub8f+dx750CgKlx3bCBTpNBk1HTzEDGwZ7uz/hx4zVN+icbksnz9YwJHiXZ4+iJGOFi4v5hnH2zl2Fm3RUTxmDsBGBgvu7yF6jISZoXyhLIShs6Vz2iWkOFfLECgUOOX9pOUxg7hAwBejRz8R9ys9UBXIrahYrcBlFTvdUle7Kiwn4oLDu2EgjREwD2hWVj5qE5X2lBodoCoaoS4fdGsDiCbO8E+EdrArajQ4DBw54yWDYuzDg9vwcPbNEJ8z2Gg7Nyk8TEMxdAu4MMehFgDHxPsNgzllquIWCXALCSt5r5JnVAALlSE6RGBy6rCiyvv2fRi4CZ8HFUxGGhuSSpME3twn0rB8xWjnyjEJApKqQKtXMFa851Eb0EcBThCADNqFtPfcRg9Z5OANKCMqiiDcsrr0cA45eDGFuVW1BTOlD8iYDPxJC9VPotDQCpiwY5meR5FWiHc9SCwelLMbl8GXo9IIPD4Dt0PyMKq8K9RL4B7W4Pdr7FgLJ/HA1R99hVMvn8IV6UmiRgeHzJQoMIjfiPCVJadsuLVf6uPdk/xuFFot9FqM1Pflmo1Elgtd4h/WIbeLQITp5XwOxwyXP01u+LNH6VF5whatW9yQfDKcgJEpkJ9hzLiuD1R2CBXuJnLR/+vsrjj+nhq6xp/qWXeW5bYWmrXVy0MOIzs4OdM3uY20z834/pf57zL6w/CRKnLd7XAAAAAElFTkSuQmCC';
			var mytitle = '<div id="brdtitle" class="inbox" style="min-height:6em;padding:10px;"><h1><a href="/a/dev/phunkybb/index.php?nid=index">Another Forums</a></h1><span style="line-height:1.9em;">Nothing exciting.</span></div>';

			var mypostbutton = '<div class="button-basic-blue" style="float: right;" onclick="location.href=\'/a/dev/phunkybb/index.php?nid=post&amp;fid=4\';"><a href="/a/dev/phunkybb/index.php?nid=post&amp;fid=4"><img src="/a/dev/phunkybb/s/img/icons/famfamfam/add.png"/>Post new topic</a></div>';

			function rotate_controls() {
					$("#ts_first").attr("src","data:image/gif;base64,"+myskip);
					$("#ts_prev").attr("src","data:image/gif;base64,"+myincr);
					$("#ts_next").attr("src","data:image/gif;base64,"+myincr);
					$("#ts_next").rotate(180);
					$("#ts_next").attr("class","next pointer");
					$("#ts_last").attr("src","data:image/gif;base64,"+myskip);
					$("#ts_last").rotate(180);
					$("#ts_last").attr("class","next pointer");
			}
			]]>
	</xsl:template>
</xsl:stylesheet>
