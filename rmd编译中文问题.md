用`rticles`包中的中的`Ctex`模板编译中文pdf总是出现下面的问题：
```
LaTeX Error: Option clash for package color
```

> 解决方法：

定位到`rticles`包中`Ctex`模板的位置，在我的电脑中，`Ctex`模板对应的`Latex`文件位于：
__C:\Users\Lenovo\Documents\R\win-library\3.4\rticles\rmarkdown\templates\ctex\resources__ .

打开`default.latex`文件，搜索`color`，然后将这一行注释掉。再重新编译，就OK了。
