---
layout: post
title: php内存回收
tags: PHP

---
## 最近在写一个从mysql导数据到memcache的php cli脚本，每次执行内存都一直上涨，内存没有回收，经过一晚的debug，终于在unset了以后释放了内存

    private static function updateGlCache($field, $value, $tabname, $mem) {
        $cache_key = get_cache_key("gl_{$field}", $value);
        $tabnames = $mem->get($cache_key);

        if($tabnames == null) {
            $mem->set($cache_key, array($tabname));
            print_r("flushing:{$field}{$value}{$tabname}\n");
        }else {
            if(!in_array($tabname, $tabnames)) {
                array_push($tabnames, $tabname);
                $mem->set($cache_key, $tabnames);
                print_r("flushing:{$field}{$value}{$tabname}\n");
            }
        }
        
        unset($tabnames); //gc
        unset($cache_key); //gc
    }

