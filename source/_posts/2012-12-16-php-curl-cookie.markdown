---
layout: page
title: PHP curl发送cookie
tags: PHP

---

如果需要实现程序自动登录功能，涉及到curl时发送cookie

关键方法

* `curl_setopt($curl, CURLOPT_HEADER, TRUE);`设置返回response header
* `curl_setopt($curl, CURLOPT_COOKIE, $cookie);`设置发送的cookie内容

### Demo


该方法发送请求时，获取response header中的Set-Cookie参数，获得PHPSESSID的值

    private function go_login_page() {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->login_page_url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_HEADER, TRUE);
        $content = curl_exec($curl);
        preg_match('/^Set-Cookie: PHPSESSID=(.*?);/m', $content, $this->phpsessid);
        curl_close($curl);
    }
   
请求登录接口，并把上一个请求中返回的cookie信息带到该请求中
    
    private function go_login() {
        $curl = curl_init();
        $cookie = "PHPSESSID=" . $this->phpsessid;
        $post_data = 'username=xx&password=xx';
        
        curl_setopt($curl, CURLOPT_COOKIE, $cookie);
        curl_setopt($curl, CURLOPT_URL, $this->go_login);
        curl_setopt($curl, CURLOPT_POST, TRUE);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_HEADER, FALSE);
        $content = curl_exec($curl);
        curl_close($curl);
    }