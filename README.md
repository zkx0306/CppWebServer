# CppWebServer

Linux 环境下基于HTTP协议的网络服务器，支持用户注册，登陆功能，并且可以请求服务器资源。服务器由 Reactor 事件触发模型 ( epoll 水平触发 + 线程池 ) 实现，数据库默认为MySQL。

测试环境
------------
* 服务器测试环境
	* Ubuntu版本16.04
* 数据库环境
	* MySQL版本5.7.29
* 浏览器测试环境
	* Windows、Mac、Linux


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

* 修改main.c中的数据库初始化信息

    ```C++
    // root root修改为服务器数据库的登录名和密码
	// qgydb修改为上述创建的yourdb库名
    connPool->init("localhost", "root", "root", "yourdb", 3306, 8);
    ```

* 生成server

    ```C++
    make server
    ```

* 启动server

    ```C++
    ./server port
    ```

* 浏览器端

    ```C++
    ip:port
    ```
