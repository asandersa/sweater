package com.example.sweater.config;

import com.example.sweater.domain.Role;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Set;

public class PutUserInModelInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest aRequest, HttpServletResponse aResponse, Object aHandler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest aRequest, HttpServletResponse aResponse, Object aHandler, ModelAndView aModelAndView) throws Exception {
        if(aModelAndView != null) {
            Principal user = aRequest.getUserPrincipal();
            aModelAndView.addObject("__user", user);
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest aRequest, HttpServletResponse aResponse, Object aHandler, Exception aEx) throws Exception { }

}
