package com.withpet.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.CHAR;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PetVO {
	
	private int petno;
	
	private int mno;
	
	private String name;
	
	private String sex;
	
	private String species;
	
	private int age;
	
	private String filepath;
	
	private String filename;
	
	private String uuid;
}
