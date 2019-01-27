## 从命令行创建一个新的仓库

* 新建一个Git仓库
```bash
echo "# learn-git" >> README.md
git init
git add README.md
git add README.md leo.txt
## 同时添加所有更改的文件
git add * 
git commit -m "first commit"
git remote add origin https://github.com/Leo-Lee15/learn-git.git
git push -u origin master
```

* 从远程pull一个已有的仓库
```bash
git remote add origin https://github.com/Leo-Lee15/learn-git.git
git push -u origin master
```


