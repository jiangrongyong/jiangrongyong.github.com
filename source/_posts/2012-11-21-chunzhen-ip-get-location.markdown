---
layout: post
title: 使用纯真IP库获取IP相关地理信息
tags: PHP IP 单例模式
---
## 下载纯真IP库文件，是一个二进制的dat文件

	http://www.cz88.net/

## 在ThinkPHP中的实现

### 加入引导文件，静态工场+单例模式，防止重复实例化

    <?php
    class IpLocation_Bootstrap {
        
        private static $_instance = null;
        
        private function __construct() {
            
        }
        
        private function __clone() {
            
        }
        
        public static function getInstance() {
            import('ORG.Net.IpLocation');
            if(null == self::$_instance) {
                self::$_instance = new IpLocation();
            }
            return self::$_instance;
        }
    }
	
> PHP单例模式注意点

> * $_instance 必须声明为静态的私有变量
* 构造函数和克隆函数必须声明为私有的,这是为了防止外部程序 new 类从而失去单例模式的意义
* getInstance()方法必须声明为公有的,必须调用此方法以返回唯一实例的一个引用
* ::操作符只能访问静态变量或静态函数
* PHP的单例模式是相对而言的,因为PHP的解释运行机制使得每个PHP页面被解释执行后，所有的相关资源都会被回收。也就是说，PHP在语言级别上没有办法让某个对象常驻内存。在PHP中，所有的变量都是页面级的，无论是全局变量，还是类的静态成员，都会在页面执行完毕后被清空,结果会重新建立新的对象，这样也就完全失去了Singleton的意义。不过,在实际应用中同一个页面中可能会存在多个业务逻辑,这时单例模式就起到了很重要的作用,有效的避免了重复new 对象(注: new 对象会消耗内存资源)这么一个行为,所以我们说PHP的单例模式是相对而言的


### 加入ThinkPHP自带iplocation扩展类

	IpLocation.class.php

### IpLocation.class.php解读

> [纯真IP数据库格式详解](http://smallerapp.com)