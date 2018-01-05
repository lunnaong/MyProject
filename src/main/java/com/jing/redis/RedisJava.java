package com.jing.redis;

import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Set;

public class RedisJava {
    public static void main(String[] args) {
        //连接本地的 Redis 服务
        Jedis jedis = new Jedis("localhost");
        System.out.println("Connection to server sucessfully");
        //查看服务是否运行
        System.out.println("Server is running: "+jedis.ping());
        //设置 redis 字符串数据
        jedis.set("w3ckey", "Redis tutorial");
        // 获取存储的数据并输出
        System.out.println("Stored string in redis:: "+ jedis.get("w3ckey"));
        //存储数据到列表中
        jedis.lpush("tutorial-list", "Redis");
        jedis.lpush("tutorial-list", "Mongodb");
        jedis.lpush("tutorial-list", "Mysql");
        // 获取存储的数据并输出
        List<String> list = jedis.lrange("tutorial-list", 0 ,5);
        for(int i=0; i<list.size(); i++) {        System.out.println("Stored string in redis:: "+list.get(i));      }
        /*// 获取数据并输出
        Set<String> list1 = jedis.keys("*");
        for(int i=0; i<list1.size(); i++) {        System.out.println("List of stored keys:: "+list1.toString());      }*/
    }
}