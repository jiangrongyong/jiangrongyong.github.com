---
layout: post
title: PHP Good Parts
tags: php

---


1. list函数

        list($table, $field)=explode('.', $field);
        $query = $this->CI->db->limit(1)->get_where($table, array($field => $str));
        
2. %s

        $lang['required'] = "The %s field is required.";