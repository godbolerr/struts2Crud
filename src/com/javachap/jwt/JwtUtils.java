package com.javachap.jwt;

import java.io.UnsupportedEncodingException;
import java.time.Instant;
import java.util.Date;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUtils {
	
	/**
	 * Hardcode all the values for now.
	 * 
	 * @param userName
	 * @return
	 */
	public static String getJwtToken(String userName){
		
		String token = "";
		
		 try {
			token = Jwts.builder()
					  .setId("2")
//					  .setIssuer("Cognizant")
//					  .setSubject(userName)
					  .claim("name", userName)
					  .claim("id", "2")          // Hardcoded for now for Node to work.
//					  .claim("scope", "admins")
//					  // Fri Jun 24 2016 15:33:42 GMT-0400 (EDT)
					  .setIssuedAt(Date.from(Instant.ofEpochSecond(1466796822L)))
//					  // Sat Jun 24 2116 15:33:42 GMT-0400 (EDT)
//					  .setExpiration(Date.from(Instant.ofEpochSecond(4622470422L)))
					  .signWith(
							  SignatureAlgorithm.HS256,
					    "secret".getBytes("UTF-8")
					  )
					  .compact();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return token;
	}

}
