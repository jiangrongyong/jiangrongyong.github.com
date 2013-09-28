---
layout: post
title: PHP construct sql with implode
tags: 

---

使用implode拼接sql

    <?php
    function construct_sql($base, $logic, $clauses, $suffix = '') {
        // initialise array to avoid warnings/notices on some PHP installations
        $queries = array();
    
        // create array of strings to be glued together by logic
        foreach ($clauses as $key => $value)
            $queries[] = "`" . escape($key) . "`='" . escape($value) . "'";
    
        // add a space in case $base doesn't have a space at the end and glue clauses together
        $base .= " " . implode(" $logic ", $queries) . " " . $suffix;
    
        return $base;
    }
    
    /**
     * @param string $str string to escape for intended use
     * @return string
     */
    function escape($str) {
        return mysql_real_escape_string($str);
    }
    
    $updates = array(
        'field1' => 'val1',
        'field2' => 'val2'
    );
    $wheres = array(
        'field1' => 'cond1',
        'field2' => 'cond2'
    );
    echo construct_sql(construct_sql("UPDATE table SET", ", ", $updates) . " WHERE ", " AND ", $wheres);