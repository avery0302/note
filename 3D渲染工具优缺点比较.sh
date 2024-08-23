3D渲染工具优缺点比较
#a-frame
3D效果：https://sketchfab.com/3d-models/aliner-a-frame-popup-camper-111e543d481d400c970ff2a433cdb1c0
渲染一个简单模型的工作量：40行左右
#three.js
3D效果：https://threejs.org/examples/webgl_materials_car.html
渲染一个简单模型的工作量：150行左右
#webgl
3D效果：https://playcanv.as/p/f4a3be4e/
渲染一个简单模型的工作量：500行左右
比较：a-frame封装度太高，不够灵活，webgl需要写大量底层的和gpu交互的代码，工作量大，三者中three.js是最常用的

#其他技术不选择的原因
openGL：和webgl一样需要编写大量低级代码，开发成本高
vtk.js：适合医疗成像或流体模型等数据可视化的展示，不适用于一般的3d渲染
babylon.js：在3d游戏方面做了增强，能够渲染更复杂的3d模型，性能比three.js稍低，待定
filament：性能超高，专注高质量的3d渲染，但是技术较新，文档有限
openCascade.js：高精度，配合CAD一起使用，不适合直接生成3d模型