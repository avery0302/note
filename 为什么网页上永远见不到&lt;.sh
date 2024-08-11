&lt;是html中的一个命名实体，在网页上永远会被自动显示为<，但是在控制台中可以打印出来
#标签字符转为命名实体的方式（html编码、转成看不懂）
function htmlEncode(str) {
  const dom = document.createElement('div');
  dom.innerText = str;
  return dom.innerHTML;
}
举例：
<转成&lt;
>转成&gt;
&转成&amp;
&lt;转成&amp;lt;

#命名实体转为标签字符的方式（html解码、转成能看懂）
function htmlDecode(str) {
  const dom = document.createElement('div');
  dom.innerHTML = str;
  return dom.innerText;
}
举例：
&lt;转成<
&gt;转成>
&amp;转成&
&amp;lt;转成&lt;