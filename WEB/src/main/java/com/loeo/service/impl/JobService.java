package com.loeo.service.impl;

import org.springframework.stereotype.Component;

/**
 * Created by LT on 2017/02/15 19:29
 */
@Component
public class JobService {
    //每隔60秒执行一次
    //@Scheduled(fixedRate = 60000)
    public void test() {
        System.out.println("job");
    }


    public void execute1() {
        System.out.printf("Task: %s, Current time: %s\n", 1, System.currentTimeMillis());
    }

    public void execute2() {
        System.out.printf("Task: %s, Current time: %s\n", 2, System.currentTimeMillis());
    }

    public void execute3() {
        System.out.printf("Task: %s, Current time: %s\n", 3, System.currentTimeMillis());
    }

    public void execute4() {
        System.out.printf("Task: %s, Current time: %s\n", 4, System.currentTimeMillis());
    }

    public void execute5() {
        System.out.printf("Task: %s, Current time: %s\n", 5, System.currentTimeMillis());
    }

    public void execute6() {
        System.out.printf("Task: %s, Current time: %s\n", 6, System.currentTimeMillis());
    }

    public void execute7() {
        System.out.printf("Task: %s, Current time: %s\n", 7, System.currentTimeMillis());
    }

    public void execute8() {
        System.out.printf("Task: %s, Current time: %s\n", 8, System.currentTimeMillis());
    }

    public void execute9() {
        System.out.printf("Task: %s, Current time: %s\n", 9, System.currentTimeMillis());
    }

    public void execute10() {
        System.out.printf("Task: %s, Current time: %s\n", 10, System.currentTimeMillis());
    }

    public void execute11() {
        System.out.printf("Task: %s, Current time: %s\n", 11, System.currentTimeMillis());
    }

    public void execute12() {
        System.out.printf("Task: %s, Current time: %s\n", 12, System.currentTimeMillis());
    }

}
