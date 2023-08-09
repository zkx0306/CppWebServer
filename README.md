# CppWebServer

Linux 环境下基于HTTP协议的网络服务器，支持用户注册，登陆功能，并且可以请求服务器资源。服务器由 Reactor 事件触发模型 ( epoll 水平触发 + 线程池 ) 实现，数据库默认为MySQL。


目录结构
------------
```C++
├── README.md
├── application
│   ├── http_conn.cpp
│   └── http_conn.h
├── database
│   ├── sql_conn_pool.cpp
│   └── sql_conn_pool.h
├── main.cpp
├── makefile
├── public
│   ├── home.html
│   ├── login.html
│   ├── loginError.html
│   ├── register.html
│   ├── registerError.html
│   └── welcome.html
├── threadpool
│   └── threadpool.h
└── util
    ├── locker.h
    ├── log.cpp
    ├── log.h
    ├── queue.h
    └── timer.h
```


运行环境
------------
* 服务器运行环境
	* Ubuntu版本16.04
* 数据库环境
	* MySQL版本5.7.29
* 浏览器环境
	* Windows、Mac、Linux主流浏览器


运行准备
------------
* 测试前确认已安装MySQL数据库

    ```C++
    // 建立yourdb库
    create database yourdb;

    // 创建user表
    USE yourdb;
    CREATE TABLE user(
        username char(50) NULL,
        passwd char(50) NULL
    )ENGINE=InnoDB;

    // 添加数据
    INSERT INTO user(username, passwd) VALUES('name', 'passwd');
    ```

* 修改main.cpp中的数据库初始化信息

    ```C++
    // 修改为服务器数据库的登录名和密码
    connPool->init("localhost", "<username>", "<passwd>", "yourdb", 3306, 8);
    ```

* 生成server

    ```C++
    make
    ```

* 启动server

    ```C++
    ./server <port>
    ```

* 浏览器端

    ```C++
    <ip>:<port>
    ```
