package com.withpet.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MemberDTO {
	
	private int mno;
	
	private String email;
	
	private String name;
	
	private String password;
	
	private int birth;
	
	private Date created_date;
	
	private String authority;


}
