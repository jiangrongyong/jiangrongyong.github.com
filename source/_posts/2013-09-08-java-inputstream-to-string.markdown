---
layout: post
title: Java Inputstream to String
tags: 

---

A nice way to do this is using [Apache commons](http://commons.apache.org/) [IOUtils](http://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html) to copy the InputStream into a StringWriter

    StringWriter writer = new StringWriter();
    IOUtils.copy(inputStream, writer, encoding);
    String theString = writer.toString();
    
---
http://stackoverflow.com/questions/309424/read-convert-an-inputstream-to-a-string
