function copyValue(field1,field2)
{
  document.getElementById(field2).value=document.getElementById(field1).value.replace(/[.]+/,'').toLowerCase();
}

