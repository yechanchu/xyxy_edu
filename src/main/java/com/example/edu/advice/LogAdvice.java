package com.example.edu.advice;

import com.example.edu.entity.Log;
import com.example.edu.entity.Teacher;
import com.example.edu.service.LogService;
import com.example.edu.util.Util;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.StringJoiner;

@Component
@Aspect
public class LogAdvice {

    @Autowired
    private LogService service;

    @After("add1() && !add2()")
    public void addLog(JoinPoint joinPoint){
        Log log = new Log();

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        HttpSession session = request.getSession(false);
        Object user = session.getAttribute("user");
        if (user != null) {
            log.setAccount(((Teacher) user).getAccount());
            log.setOperator(((Teacher) user).getName());
        }

        log.setId(Util.get32uuid());
        log.setIp(request.getRemoteAddr());
        String method = joinPoint.getSignature().toShortString();
        Object[] args = joinPoint.getArgs();
        StringJoiner joiner = new StringJoiner(",");
        for (Object arg :
                args) {
            joiner.add(arg.toString());
        }
        log.setDescription("方法：" + method);
        log.setCreate_time(Util.getCurrentTime());
        service.save(log);
    }

    @Pointcut("execution(* *..service.impl.*.*(..))")
    public void add1(){}

    @Pointcut("execution(* *..service.impl.*.save(..))")
    public void add2(){}

}
