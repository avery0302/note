#dom加载时会跳出弹框的结构
攻击方式a：<img src="x" onerror="alert(250)">
攻击方式b：<link rel="stylesheet" href="x.css" onerror="alert(250)">
攻击方式c：<object data="x.pdf" onerror="alert(250)"/>
攻击方式d：<script src="x.js" onerror="alert(250)"></script>
攻击方式e：<script>alert(250)</script>
#移出悬浮时会跳出弹框的结构（关不掉）
攻击方式f：<div onmouseout="alert(250)">取消</div>
#点击时会跳出弹框的结构（关不掉）
攻击方式g：<input onfocus="alert(250)">
#点击时会跳出弹框的结构
攻击方式h：<button onclick="alert(250)">取消</button>

#代码漏洞：原生html的innerHTML
<input type="button" onclick="document.getElementById('target').innerHTML='<img src=\'x\' onerror=\'alert(250)\'>'" value="一键攻击">
<div id="target">攻击目标</div>
注：从外到内，双引号、单引号、转义的单引号
可以用a/b/c/f/g/h成功攻击（只有script被控制住了）
防范方式：
如果内容为用户输入，innerHTML改成innerText
innerHTML会把内容当做dom结构，innerText会把内容当做普通文本，而用户输入的永远不应该当做dom结构

#代码漏洞：vue的v-html
<script setup>
import { ref } from 'vue'
const msg = ref('<img src="x" onerror="alert(250)">')
</script>
<template>
  <div v-html="msg"/>
</template>
可以用a/b/c/f/g/h成功攻击（只有script被控制住了）
防范方式：
如果内容为用户输入，v-html改成v-text，或者写在双花括号里

#代码漏洞：vue的v-html进阶
<script setup>
import { ref } from 'vue'
const msg = ref('&#x3C;img src="x" onerror="alert(250)"&#x3E;')
function htmlDecode(str) {
  const dom = document.createElement('div');
  dom.innerHTML = str;
  return dom.innerText;
}
</script>
<template>
  <div v-html="htmlDecode(msg)"/>
</template>

#代码漏洞：js内置函数setTimeout和eval
setTimeout("alert(250)", 1000)
eval("alert(250)")
防范方式：
setTimeout执行的内容禁止从外部输入，eval直接放弃使用