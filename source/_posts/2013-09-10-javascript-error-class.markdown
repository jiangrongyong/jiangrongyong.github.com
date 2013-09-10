---
layout: post
title: Javascript Error Class
tags: 

---

* Error

        function Error(msg,id) {}
        Error = {};

* EvalError

        EvalError.prototype = new Error();
        EvalError = {};

* RangeError

        RangeError.prototype = new Error();
        RangeError = {};

* ReferenceError

        ReferenceError.prototype = new Error();
        ReferenceError = {};

* SyntaxError

        SyntaxError.prototype = new Error();
        SyntaxError = {};

* TypeError

    A TypeError is thrown when a value is a different type than what was expected  
    比较常用，当参数或变量跟预期不一样，就可以抛出这个异常

        TypeError.prototype = new Error();
        TypeError = {};

* URIError

        URIError.prototype = new Error();
        URIError = {};
