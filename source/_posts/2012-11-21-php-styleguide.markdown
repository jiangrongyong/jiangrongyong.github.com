---
layout: post
title: PHP Styleguide
tags: PHP

---

# PHP Styleguide

## Coding Style

* 缩进使用4个空格
* 行尾不能有空格
* 操作符两边使用空格，逗号后面使用空格

        $sum = 1 + 1;
        call($a, $b);
        1 > 2 ? true : false; 
        
* `(`,`)`,`[`,`]`两边无空格

        test()['a'];
        $arr['data'] = 'test';
        
* `if`语句

        if($a == 1) {
            echo 1;
        } else if($ == 2) {
            echo 2;
        } else {
            echo 0;
        }
        
* `switch`语句

        switch($a) {
            case 1:
                echo 1;
                break;
            case 2:
                echo 2;
                break;
            default:
                echo 0;
                break;
        }
        
* `function`定义

        function test() {
            echo 'test';
        }
        
* `class`定义

        class A {
            
            private $a;
            
            public function printA() {
                echo $this->a;
            }
            
        }
        
## 命名规范

* 类名首字母大写
* 方法和变量使用驼峰
* 常量全大写