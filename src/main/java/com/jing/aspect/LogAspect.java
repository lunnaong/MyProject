package com.jing.aspect;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class LogAspect {
 //   private final static Log LOGGER = LogFactory.getLog(APIProxy.class);

    //切面应用范围是在com.mj.spring.aop包下面所有函数
    @Around("execution(* com.jing.controller..*.*(..))")
    public void aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
       /* String signatureName = joinPoint.getSignature().getName();
        Class<? extends Object> invokeClass = joinPoint.getTarget().getClass();
        if (isTagged(invokeClass, signatureName)) {
            LOGGER.info(signatureName + " is tagged");
            joinPoint.proceed();
            return;
        }*/
        System.out.println("hello*****");
        joinPoint.proceed();
        System.out.println("****world!");

    }


}
