package com.care.library.search;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SearchMapper {

	int popularInsert(BookDTO book);
	
	int recentInsert(BookDTO book);

	void deleteData(String whichTable);
	
	ArrayList<String> getBookImages(String whichTable);

}