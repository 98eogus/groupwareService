package com.portfolio.project.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Component
@Aspect
public class LoginCheckAspect {

    @Around("execution(* com.portfolio.project.controller.BoardController.write(..))")
    public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        // 현재 요청과 관련된 attributes를 가져옵니다.
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

        // 현재 HTTP 요청을 가져옵니다.
        HttpServletRequest request = attr.getRequest();

        // 현재 HTTP 세션을 가져옵니다.
        HttpSession session = request.getSession(false); // false: 존재하지 않으면 null 반환

        if (session != null && session.getAttribute("id") != null) {
            return joinPoint.proceed(); // 로그인이 되어있다면 원래 메서드 실행
        } else {
            // 로그인 페이지로 리다이렉트
            return "redirect:/login?toURL=" + request.getRequestURL();
        }
    }
}
