---
layout: page
title: 关于PHP数组合并
tags: PHP

---

> The union operator did not behave as I thought it would on first glance. It 
implements a union (of sorts) based on the keys of the array, not on the values.

*PHP中合并操作符"+"跟我的第一印象认为的不太一样，它是基于key集合实现的数组合并，并不是value*



For instance:

	<?php
		$a = array('one','two');
		$b=array('three','four','five');

		//not a union of arrays' values
		echo '$a + $b : ';
		print_r ($a + $b);

		//a union of arrays' values
		echo "array_unique(array_merge($a,$b)):";
		// cribbed from http://oreilly.com/catalog/progphp/chapter/ch05.html
		print_r (array_unique(array_merge($a,$b)));
	?>

output

	$a + $b : Array
	(
    	[0] => one
	    [1] => two
    	[2] => five
	)

	array_unique(array_merge(Array,Array)):Array
	(
    	[0] => one
	    [1] => two
    	[2] => three
	    [3] => four
    	[4] => five
	)