server: main.cpp ./threadpool/threadpool.h ./application/http_conn.cpp ./application/http_conn.h ./util/locker.h ./util/log.cpp ./util/log.h ./util/queue.h ./database/sql_conn_pool.cpp ./database/sql_conn_pool.h
	g++ -o server main.cpp ./application/http_conn.cpp ./util/log.cpp ./database/sql_conn_pool.cpp -lpthread -lmysqlclient

clean:
	rm -f server
