package com.haeyo.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {

	@Pointcut("execution(* com.haeyo.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.haeyo.biz..*Impl.get*(..))")
	public void getPointcut() {}
}
