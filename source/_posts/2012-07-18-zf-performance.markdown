---
layout: post
title: zf性能测试
tags: PHP ZendFramework

---

# 背景

在最近一次压力测试中，发现zend framework框架的性能很差，请求一上来cpu就瞬间100%，而且qps很很不理想

# 实测

* 两台服务器负载均衡情况下，使用ab的测试情况，测试程序使用zend framework打印hello world，cpu瞬间60%

`ab -c 10 -n 2000 http://peifusvr/api/accttest/pfm`

    Server Software:        nginx/0.6.39
    Server Hostname:        peifusvr
    Server Port:            80

    Document Path:          /api/accttest/pfm
    Document Length:        17 bytes

    Concurrency Level:      10

    Time taken for tests:   5.656198 seconds
    Complete requests:      2000
    Failed requests:        0
    Write errors:           0
    Total transferred:      388000 bytes
    HTML transferred:       34000 bytes
    Requests per second:    353.59 [#/sec] (mean)
    Time per request:       28.281 [ms] (mean)
    Time per request:       2.828 [ms] (mean, across all concurrent requests)
    Transfer rate:          66.83 [Kbytes/sec] received

    Connection Times (ms)
              min  mean[+/-sd] median   max
    Connect:        0    0   0.0      0       0
    Processing:    17   27   7.8     26      64
    Waiting:       17   27   7.8     26      64
    Total:         17   27   7.8     26      64

    Percentage of the requests served within a certain time (ms)
       50%     26
       66%     29
       75%     32
       80%     34
       90%     39
       95%     43
       98%     48
       99%     53
      100%     64 (longest request)

* 单台服务器情况下

`ab -c 20 -n 2000 http://10.20.223.111/api/accttest/pfm`

    Server Software:        nginx
    Server Hostname:        10.20.223.111
    Server Port:            80
    Document Path:          /api/accttest/pfm
    Document Length:        17 bytes
    Concurrency Level:      20
    Time taken for tests:   11.552084 seconds
    Complete requests:      2000
    Failed requests:        0
    Write errors:           0
    Total transferred:      328000 bytes
    HTML transferred:       34000 bytes
    Requests per second:    173.13 [#/sec] (mean)
    Time per request:       115.521 [ms] (mean)
    Time per request:       5.776 [ms] (mean, across all concurrent requests)
    Transfer rate:          27.70 [Kbytes/sec] received
    Connection Times (ms)
                  min  mean[+/-sd] median   max
    Connect:        0    0   0.0      0       0
    Processing:    28  114  29.5    112     275
    Waiting:       28  114  29.5    112     275
    Total:         28  114  29.5    112     275
    Percentage of the requests served within a certain time (ms)
      50%    112
      66%    124
      75%    132
      80%    138
      90%    154
      95%    166
      98%    183
      99%    195
     100%    275 (longest request)

