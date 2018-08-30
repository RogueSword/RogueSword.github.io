---
title: 读书笔记《你不知道的Javascript》
copyright: true
date: 2018-08-25 15:38:31
tags: ['笔记']
categories: 
comments:
password:
---
![](http://p8sur5u78.bkt.clouddn.com/s28033372.jpg)

> 去年的某时在群内听闻此书名，不以为然。想来也是和普通的书本无异，这段日子又在GitHub上面看到了开源文档，star数目不小。下载下来电子版，看了一小节原型链，不禁耳目一新，真可谓打通任督二脉。话不多说，立马当当下单开啃。在此记录下学习笔记，以供日后回读。

## 语法新特性
### Number.EPSILON（ES6） - 可接受的误差范围
Number.EPSILON是ES新特性，表示1和大于1的最小浮点数的差值，值为Math.pow(2, -52);可以用作测试值是否相等
> 实例：验证0.1 + 0.2 = 0.3。

- 说明：鉴于js遵循IEEE754规范，属于二进制浮点数的最大问题，就是0.1和0.2不够准确，相加之后会得到一个很接近的一个数字0.30000000000000004，因此判断会得到false

- 解决：设置误差范围，即计算结果在误差范围内即可
```javascript
var a = 0.1;
var b = 0.2;
var c = 0.3;
var isEqual = (a + b -c) < Number.EPSISON;
```

- ES5 - polyfill
```js
if (!Number.EPSILON) {
  Number.EPSILON = Math.pow(2, -52);
}
```





## 体系缺漏
### 显示与隐式类型转换
显示：String(...), Number(...), Booolean(...)这种不带new的是显示类型转换；一元运算符：+XX 和 !XX 也是显式转换（注意：!XX不仅转类型，且将其值的布尔类型值反转，因此 !!XX 是合理的显示）
隐式： 












## 易错点
### ~~和Math.floor()
注意点：正数时候结果相同；但是负数时候则不同
```js
// 正数
Math.floor(9.9);     // > 9
~~9.9                // > 9

// 负数
Math.floor(-9.9);    // > -10
~~-9.9               // -9 
```

###　[关于JSON.stringify()使用的注意事项](https://blog.csdn.net/pika_lzy/article/details/79212476)


### parseInt
语法：parseInt(string[, radix])，如果没有第二个参数，默认为10。**同时如果第一个参数不是字符串，则会将其转为字符串再做操作**
```js
// 示例1
parseInt(new String(42));   // > 42, 将String对象拆封再将数字转为字符串，再做处理

// 示例2
var a = {
    num: 2,
    toString () {
        return String(this.num * 2);
    }
};
parseInt(a);    // > 4
```

### [] + {}和{} + [] TODO: 《中》 5.1.3
```js
[] + {}   // > [object object]
{} + []   // > 0
```












## 代码片段
### ~和indexOf检查字段存在性
- ~a按位非运算符: ~x 等同于 -(x+1)
- indexOf语法： stringObject.indexOf(searchvalue[,fromindex])，如果没有第二个参数，则从0开始检测searchValue出现的位置(从0开始)，如未找到，则返回-1

> 通常我们在检测字段时使用 >= 0 和 == -1 做判断，这样的写法不是很好，称为'抽象渗透'，意思是在代码中暴漏了底层的实现细节(见书本p61)

- 解决：~(str.indexOf(target))作为判断的代码片段，当未检测到即返回的结果是-1时，~-1的结果为0，隐式转为布尔型，判断结果同为false
```js
var str = 'hello world';
var target = 'roy';
if (~str.indexOf(target)) {    // false
  console.log('find it');
}
```


