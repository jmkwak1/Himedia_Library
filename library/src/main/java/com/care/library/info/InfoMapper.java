package com.care.library.info;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfoMapper {

	int findMaxNum();

	void writeNotice(NoticeDTO notice);

	ArrayList<NoticeDTO> selectAllNotice(int begin, int end);

	int count();

	ArrayList<NoticeDTO> selectNotice(String select, String search, int begin, int end);

	NoticeDTO selectNoticeContent(int no);

	void updateNoticeHit(int no);

	void deleteNotice(int no);
	
	void updateNotice(int no, String title, String content);

	int findMaxNumFaq();

	void writeFaq(FaqDTO faq);

	ArrayList<FaqDTO> selectFaq(String category);

	FaqDTO selectFaqContent(int no);

	void updateFaq(FaqDTO faq);

	void deleteFaq(int no);

	void updateNoticeFile(NoticeDTO notice);

	int findMaxNumFree();

	void writeFree(FreeDTO free);

	ArrayList<FreeDTO> selectAllFree(int begin, int end);

	int countFreeAll();

	FreeDTO selectFreeContent(int no);

	void updateFreeHits(int no);

	void updateFree(FreeDTO free);

	void deleteFree(int no);



}
