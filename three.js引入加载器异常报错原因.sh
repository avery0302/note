three.js引入加载器异常报错原因
#错误提示
Failed to resolve module specifier "three". Relative references must start with either "/", "./", or "../".
#r148和r147版本差别
正确 <script src="https://cdn.jsdelivr.net/npm/three@0.147.0/examples/js/loaders/GLTFLoader.js"></script>
报错 <script src="https://cdn.jsdelivr.net/npm/three@0.148.0/examples/js/loaders/GLTFLoader.js"></script>
#原因
https://cdn.jsdelivr.net/npm/three@0.148.0/examples/js/loaders/GLTFLoader.js
该文件不存在
关键版本节点：r148（2022.12.22）
该节点后的版本不再支持非ES6方式引入加载器

#原生js使用r148之后版本的three必须引入vite，原因如下
1、r148之后的three删除了js文件夹下的加载器，只保留了jsm下的加载器
2、jsm下的glbLoader文件含有import * from 'three'字段
3、'three'在原生js中会被认定为网址，增加type=module会被认定为根目录下的three文件夹
4、所以必须本地安装three依赖，使用npm会安装到node_modules路径下，仍然不在根目录下
5、需要让three路径映射到node_modules/three路径，而原生js不支持路径别名映射，vite中的模块解析刚好可以做到路径映射的效果
6、所以需要使用vite框架，或者webpack，或者vue-cli(基于webpack)

不想引入vite框架，就只能使用cdn方式引入r148以下的版本