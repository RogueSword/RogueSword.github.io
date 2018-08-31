---
title: commonJS和ES6模块化
copyright: true
date: 2018-08-30 15:24:33
tags: ['ES6','模块化']
categories: 
comments:
password:
---
> 随js语言持续优化，为我们的开发带来较大的便利性。但是在使用node和es6的模块化功能时候，两者的使用方式还是有点区别。在这里做一小结，以便日后查阅
## CommonJS

## 基本的使用规范
### CommonJS
- 主要是Node.js的使用规范，
- 每一个js都是一个独立的模块，并且里面的变量名称互不冲突。使用规则为一个模块向外导出变量，另一个模块导入变量
- 语法
  - 导出的模块：module.exports = '变量名'
  - 导入的模块：var newName = require('./导出模块的路径');
- 注意使用事项：由于导出的写法不同，因此导入后的使用方式也不通具体如下
```
<!-- 写法一 -->
// export.js
var a = 'Shen Zhen';
function greet(name) {
  console.log(`welcome ${name}, ${a}`);
}
module.exports = greet;

// import.js
var a = 'Roy';
var method = require('./export.js');
method(a);  // 直接将引入的方法调用

<!-- 写法2 -->
// export.js
module.exports = {
  greet: greet
}

// import.js
var obj = require('./export.js');   // 此时引入的是个对象，因此需要对对象的调用
obj.greet(a);

<!-- 写法3：不推荐，容易混淆 -->
// export.js
exports.greet = greet;

// import.js
var obj = require('./export.js');   // 此时引入的是个对象，因此需要对对象的调用
obj.greet(a);
```
> 注意：在写法2和3中，我们可以看到，两者导出的均为一个对象。实际上在node中，module.exports和exports是同一个变量，并且初始化为一个空对象{}。在这个空对象中，可以存放键值对形式的方法。**但是如果要导出的是数组或者函数，则必须使用module.exports**，实际上，记住一点即可，使用module.exports总是不会错的！

- 其他：对于引用node的一些内置模块的时候，可以直接引用
```code
const http = require('http');
http.createServer((request, response) => {

}).listen('8080')
```

### ES6模块化
- 常见的几种写法
  - 写法1：直接export导出
  ```js

  ```
  - 写法2：定义后再导出
  ```js

  ```
  - 写法3：export导出时候，可以将导出的模块名变更后再导出
  ```js
  ```
  - 写法4：
  ```js
  ```
-  

## 区别
- CommonJS输出的是一个值的拷贝，ES6输出的是值的引用
- CommonJS是模块运行时加载，ES6是编译时输出接口


> 参考：
1. [廖雪峰-js教程](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434502419592fd80bbb0613a42118ccab9435af408fd000)
2. [js当中CommonJS 和es6的模块化引入方案以及比较](https://blog.csdn.net/jackTesla/article/details/80796936)
3. [ES6新特性：使用export和import实现模块化](https://www.cnblogs.com/diligenceday/p/5503777.html)