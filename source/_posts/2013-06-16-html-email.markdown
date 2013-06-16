---
layout: post
title: Html Email 注意事项
tags: html

---

1. Doctype使用XHTML 1.0 Strict，不能用HTML5
2. 使用table布局

		<body style="margin: 0; padding: 0;">
		　<table border="1" cellpadding="0" cellspacing="0" width="100%">
		　　<tr> 
		　　　<td> Hello! </td>
		　　</tr>
		　</table>
		</body>
		
3. 图片是唯一可以引用的外部资源。其他的外部资源，比如样式表文件、字体文件、视频文件等，一概不能引用。
4. 所有的CSS规则，最好都采用行内样式。因为放置在网页头部的样式，很可能会被客户端删除。客户端对CSS规则的支持情况，请看这里。
5. Content-Type要使用

		Content-Type: Multipart/Alternative;
		
---

参考文章

* http://www.ruanyifeng.com/blog/2013/06/html_email.html