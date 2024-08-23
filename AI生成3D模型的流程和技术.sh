AI生成3D模型的流程和技术
#图片转3D
网页输入图片-深度图-点云-3D表面模型-纹理映射-网页渲染3D模型
#
图片-深度图：单目深度估计/OpenCV
深度图-点云：PCL/Open3D
点云-3D表面模型：Delaunay三角化/Poisson表面重建
图片-纹理映射：UV映射
网页渲染3D模型：three.js/webGL

#文字转3D
网页输入文字-3D表面模型-纹理映射-网页渲染3D模型
#
文字-3D表面模型：NLP/生成对抗网络
文字-纹理映射：NLP/生成对抗网络/UV映射
网页渲染3D模型：three.js/webGL

#架构
js-java-python-java-js
#
js：负责网页输入图片文字、最终的网页渲染3D图
java：负责数据存储、集成js和python
python：负责所有复杂的训练