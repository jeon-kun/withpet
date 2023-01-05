package com.withpet.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class MemberVO implements Serializable {
	
	private int mno;
	
	private String email;
	
	private String name;
	
	private String password;
	
	private int birth;
	
	private Date created_date;
	
	private String authority;

}
