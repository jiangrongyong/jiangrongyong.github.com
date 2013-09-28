---
layout: post
title: 关于ETag、Last-Modified、Cache-Control和Expires总结
tags: 

---

### 相关名词

1. ETag

    * Nginx 1.3.3版本开始支持，打开ETag支持后，Response Header会返回，如`ETag:"52468652-169d5"`。下一次客户端的http请求中如果包含`If-None-Match`头，如`If-None-Match:"52468652-169d5"`，Nginx就会比较该值和计算出的ETag，一致就返回304。
    
    * ETag开关
    
            etag on | off; // 缺省为on
            
    * `If-Modified-Since`和`If-None-Match`是与的关系，即均满足条件才返回304。
    
2. Last-Modified

    * 在第一次请求某个服务器资源时，服务器端的返回状态会是200，同时Response Header会返回Last-Modified，表示该资源在服务期端最后被修改的时间，如`Last-Modified:Sat, 28 Sep 2013 07:33:38 GMT`。
    * 当第二次请求该资源时，浏览器会在Request Header中带有If-Modified-Since，询问该时间之后资源是否有被修改过，如`If-Modified-Since:Sat, 28 Sep 2013 07:33:38 GMT`，如果服务器端的资源没有变化，则返回304。
    * 配合Expires可以做浏览器或代理服务器本地缓存


3. Nginx中的expires

    * 如果Nginx设置了`expires 1d;`，那么Response Header新增返回两个头信息，分别是`Cache-Control`和`Expires`
    * 如果Nginx设置了`expires -1;`，那么Cache-Control会被设为no-cache，Expires则被设为当前服务器时间减1秒
    * 如果设置了`expires 1d;`，在第一次请求某个服务器资源时，服务器端的返回状态会是200，同时Response Header会返回Last-Modified和Expires和Cache-Control，这时浏览器客户端会把该资源缓存在本地1天，如果使用浏览器的转到按钮、或者在地址栏直接回车、或者打开新窗口重新输入该网址，这时浏览器不会访问服务端，而是直接读取浏览器客户端缓存，在Chrome dev tool的Network下显示的是`from cache`，在Firefox的firebug下显示的是没有任何请求情况，网络请求为空
        
4. Cache-Control
    
    表示该资源的有效期，如`Cache-Control:max-age=86400`，优先级比Expires要高
        
    Cache-Control有如下取值
        
    * no-cache 数据内容不能被缓存, 每次请求都重新访问服务器    
    * max-age 相对过期时间, 即以秒为单位的缓存时间
    
    Request Header中的Cache-Control
    
    * Cache-Control:max-age=0 如果使用浏览器的刷新按钮、F5刷新或者是Mac Chrome下的Command + r刷新，浏览器就会设置成这个头，表示不走浏览器客户端缓存，要从服务端获取，服务端有可能返回304或者200
    * Cache-Control:no-cache 如果使用浏览器的强制刷新，如Ctrl+ F5或者是Mac Chrome下的Command + Shift + r，浏览器就会设置成这个头，表示既不走浏览器客户端缓存，也不走服务端缓存，服务端返回200，不会返回304

5. Expires
    
    * 表示该资源过期的GMT时间，如`Expires:Sun, 29 Sep 2013 08:34:15 GMT`
    * 配合Last-Modified可以做浏览器或代理服务器本地缓存

### 浏览器的三种刷新方式

1. 使用浏览器的转到按钮、或者在地址栏直接回车、或者打开新窗口重新输入该网址

    优先走浏览器本地缓存，如果本地有缓存则根本不会访问服务器
    
    注：如果是chrome下，在本窗口下的地址栏直接回车，html不会走本地缓存，如果是新开窗口在地址栏输入网址回车，则html依然会走本地缓存。估计是chrome的策略，firefox下则都会走本地缓存

2. 使用浏览器的刷新按钮、F5刷新或者是Mac Chrome下的Command + r刷新

    不走浏览器本地缓存，不过会走服务端缓存，会返回304

3. 使用浏览器的强制刷新，如Ctrl+ F5或者是Mac Chrome下的Command + Shift + r

    既不走浏览器本地缓存，也不走服务端缓存，不返回304