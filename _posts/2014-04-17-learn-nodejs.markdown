---
layout: post
title:  "learn node.js"
date:   2014-04-17 10:54:31
description:  "learn node.js"
categories: nodejs
tages: nodejs
---

+ js中有很多常用的高阶函数，[map][maplink],[filter][filterlink],[some][somelink],[every][everylink],[reduce][reducelink]
{% highlight javascript %}
function checkUsersValid(goodUsers) {
    return function(submittedUsers) {
        return submittedUsers.every(function(submitteduser){
            return goodUsers.some(function(gooduser){
                return gooduser.id === submitteduser.id;
            });
        });
    };
}
module.exports = checkUsersValid
function countWords(inputWords) {
    return inputWords.reduce(function(previous ,current,id,array){
        if ( previous.hasOwnProperty(current) ){
            previous[current] += 1;           
        }else{
            previous[current] = 1;
        }
        return previous;
    }, {});
}
module.exports = countWords
{% endhighlight %}


+ js中可以使用prototype获取对象中方法和属性的原型，然后使用call调用，js中的function参数可以通过arguments变量获取，该变量类似与array，所以可以使用array原型中的slice方法，将其转化为array。function默认带apply方法类似与call，但arguments则是用数组传入,直接调用。bind类似返回方法。
{% highlight javascript %}
      var slice = Array.prototype.slice
    
      function logger(namespace) {
        return function() {
          console.log.apply(console, [namespace].concat(slice.call(arguments)))
        }
      }
    
      module.exports = logger
module.exports = function(namespace) {
    return console.log.bind(null,namespace);
}
{% endhighlight %}


+ js可以修改实例的动态方法行为,不过注意保存原方法的引用。
{% highlight javascript %}
      function Spy(target, method) {
        var originalFunction = target[method]
        // use an object so we can pass by reference, not value
        // i.e. we can return result, but update count from this scope
        var result = {
          count: 0
        }
        // replace method with spy method
        target[method] = function() {
          result.count++ // track function was called
          return originalFunction.apply(this, arguments) // invoke original function
        }
        return result
      }
      module.exports = Spy
{% endhighlight %}


+ js递归的转化，有点凶残.将方法作为返回值不断的调用。
{% highlight javascript %}
      function repeat(operation, num) {
        if (num <= 0) return
        return function() {
          operation()
          return repeat(operation, --num)
        }
      }
    
      function trampoline(fn) {
        while(fn && typeof fn === 'function') {
          fn = fn()
        }
      }
    
      module.exports = function(operation, num) {
        trampoline(function() {
          return repeat(operation, num)
        })
      }
{% endhighlight %}

+ js 异步数据加载
{% highlight javascript %}
function loadUsers(userIds, load, done) {
    var completed = 0;
    var users = [];

    userIds.forEach(function(item,index){
        load(item ,function(user){
            users[index] = user;
            completed ++;
            if (completed === userIds.length) {
                done(users);
            }
        });
    });

}
{% endhighlight %}


+ js ,超级变态的调用方式
{% highlight javascript %}
function curryN(fn, n) {
    if (typeof n !== 'number') n = fn.length
    
    function getCurriedFn(prev)
    {
        return function(arg) {
            var args = prev.concat(arg)
            if (args.length < n) return getCurriedFn(args)
            else return fn.apply(this, args)
        };
    }

    return getCurriedFn([]);
}

module.exports = curryN

{% endhighlight %}

+ 更加变态的调用，简直不能理解
{% highlight javascript %}
// Explained:
// The value of `this` in Function.call is the function
// that will be executed.
//
// Bind returns a new function with the value of `this` fixed
// to whatever was passed as its first argument.
//
// Every function 'inherits' from Function.prototype,
// thus every function, including call, apply and bind 
// have the methods call apply and bind.
//
// Function.prototype.call === Function.call
module.exports = Function.call.bind(Array.prototype.slice)
{% endhighlight %}






[maplink]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
[filterlink]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
[somelink]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some
[everylink]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every
[reducelink]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce





















