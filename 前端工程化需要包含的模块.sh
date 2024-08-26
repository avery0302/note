前端工程化需要包含的模块

10类+20个文件
#1.依赖引入+打包
npm:依赖引入(package.json)
vite:模块解析、热更新(vite.config.ts)
#2.简化html
vue:页面区和变量区的映射，内置命令减少代码行数(index.html | src/App.vue | src/main.ts | src/assets)
#3.简化js+ts
ts:ts编译成js(tsconfig.json | tsconfig.app.json | tsconfig.node.json | tsconfig.vitest.json)
babel:处理js语法转换，ES6+降为ES6-
#4.简化css
scss/less:样式嵌套、复用
#5.版本控制
git:配置不提交的文件，比如node_modules(.gitignore)
#6.代码规范
prettier:美观(.prettierrc.js)
eslint:合法(.eslintrc.js)
#7.测试框架
vitest:单元测试(vitest.config.ts)
playwright:端到端测试(playwright.config.ts)
#8.编译后的静态文件
dist:多个.vue编译成一个.html(dist/index.html | dist/assets)
#9.部署脚本+环境变量文件
sh:npm安装依赖、node启动服务器(.build/buildObs.sh)
env:不同环境使用不同的地址(.env.toma.prod)
#10.项目介绍文件(README.md)