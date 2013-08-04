---
layout: post
title: Fibonacci Algorithm
tags: algorithm

---

`1,1,2,3,5,8,13,21`依次类推下去，你会发现，它后一个数等于前面两个数的和。在这个数列中的数字，就被称为斐波那契数(Fibonacci Sequence)。

任何相邻的两个数，次第相除(如8/13,13/21)，其比率都最为接近`0.618`这个值，它的极限就是所谓的"黄金分割数"。

递推关系

    f(1)=1
    f(2)=1
    f(n)=f(n-1)+f(n-2) //n>=2
    3f(n)=f(n+2)+f(n-2)
    
用PHP打印斐波那契数

    <?php
    function fib($n) {
	    if($n <= 1) {
		    return $n;
    	}
	    return fib($n - 1) + fib($n - 2);
    }

    for($i = 0; $i < 9; $i++) {
	    echo fib($i) . ' ';
    }

github source

[https://github.com/jiangrongyong/algorithm]()

优化方案，加入缓存
Ruby

    def fibonacci(n, cache=Hash[[[0,0],[1,1]]])
        return cache[n] if cache[n]
        cache[n] = fibonacci(n-2, cache) + fibonacci(n-1, cache)
    end
    puts (1...1000).to_a.collect{|t| fibonacci(t) }.join(', ')
