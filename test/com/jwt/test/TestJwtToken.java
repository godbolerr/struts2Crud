package com.jwt.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.javachap.jwt.JwtUtils;

public class TestJwtToken {

	@Test
	public void test() {
		String token = JwtUtils.getJwtToken("test");
		System.out.println(token);
	}

}
