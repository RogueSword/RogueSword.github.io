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

## 基本的使用规范
### CommonJS
- 主要是Node.js的使用规范，
- 每一个js都是一个独立的模块，并且里面的变量名称互不冲突。使用规则为一个模块向外导出变量，另一个模块导入变量
- 语法
  1. 导出的模块：module.exports = '变量名'
  2. 导入的模块：var newName = require('./导出模块的路径');
- 注意使用事项：由于导出的写法不同，因此导入后的使用方式也不通具体如下
```js
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

- 其他：对于引用node的一些内置模块时，可以直接引用其模块名称
```js
const http = require('http');
http.createServer((request, response) => {

}).listen('8080')
```

### ES6模块化
- 常见的几种写法
  1. 直接export导出。es6将其视为一个模块,export分别对外将变量导出
  ```js
  // export.js
  // 也可以写做连续声明变量的形式，去掉第二个export字段，在第一个最后写上','
  export var name = 'Roy';
  export function getName(name) {
    console.log(name);
  }

  // import.js
  import {name, getName} from './export.js'
  getName();
  ```
  2. 先正常定义，后导出。推荐此方法，清晰明了
  ```js
  // export.js
  const name = 'Roy';
  let getName = function (name) {
    console.log(name);
  }

  // import.js
  export {name, getName}; 
  getName();
  ```
  3. export导出时候，可以将导出的变量重命名后再导出
  ```js
  // export.js
  const name = 'Roy';
  let getName = function() {
    console.log(name);
  }
  export {
    name as nn,
    getName as get
  }
  ```

  4. import导入的时候，可以将导入的变量重命名 
  ```js
  // import.js
  // 注意导入的模块名必须和导出时写的变量名一致，同时导入后的模块只读，只能使用，不可再做修改重定义。但是，当且导出的是个对象，导入的js里面可以修改对象的属性，同时也改变了原始处的值。不推荐使用
  // 导入时候地址可以相对路径，也可以绝对路径，
  // 导入时.js后缀可以省略
  import {getName as getMethod} from './export.js'
  ```

  5. 设置模块中转站js，匿名转载他处的变量。export2中仅作为中转站，在它里面是无法使用export1.js导出的变量
  ```js
  // export1.js
  export let name = 'name', getName = function() {};

  // export2.js
  export * from './export1.js'  // export {name, getName} from './export1.js'

  // import.js
  import {name, getName} from './export2.js'
  console.log(name);
  console.log(getName());
  ```

  6. 终极简化1 -> import整体引入,用*替代具体的变量名，同时将其重命名。export *命令会忽略export模块的default方法
  ```js
  // export.js
  export var name = 'Roy', function getName() {};

  // import.js
  import * as obj from './export.js';
  obj.name;       // > Roy
  obj.getName();  // 
  ```

  7. 终极简化2 -> export default xxx后，在import时就无需将导入的变量名与导出的保持一致了，用户可以随意命名。实际上export default就是输出了一个叫做default的变量或者方法,然后系统允许在引入它的时候改写为任何名字
  ```js
  // export.js
  var name = 'Roy';
  export default name;

  // import.js - 注意此处引入时候无需{}
  import nnn from './export.js'
  ```

  8. 小结：导出普通变量和函数的小结。注意接口名和内不变量之间要有一一对应关系
  ```js
  // 普通变量 - 1
  export var m = 1;
  // 普通变量 - 2
  var m = 1;
  export {m};
  // 普通变量 - 3
  var m = 1;
  export {m as n};

  // 函数 - 1
  export function getName() {}
  // 函数 - 2
  function getName() {}
  export {getName}
  ```
## 区别
- CommonJS输出的是一个值的拷贝；ES6输出的是值的引用
- CommonJS是模块运行时加载；ES6是编译时完成模块加载，效率更高

> 参考：
1. [廖雪峰-js教程](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434502419592fd80bbb0613a42118ccab9435af408fd000)
2. [js当中CommonJS 和es6的模块化引入方案以及比较](https://blog.csdn.net/jackTesla/article/details/80796936)
3. [ES6新特性：使用export和import实现模块化](https://www.cnblogs.com/diligenceday/p/5503777.html)
4. [阮一峰-ES6模块化](http://es6.ruanyifeng.com/#docs/module)