package com.care.library.search;

public class BookDTO {
	private String ranking;
	private String publicationYear;
	private String bookName;
	private String authors;
	private String publisher;
	private String bookImageURL;
	private String vol;
	private String restVol;
	private String isbn;
	private int totalId;

	public int getTotalId() {
		return totalId;
	}

	public void setTotalId(int totalId) {
		this.totalId = totalId;
	}

	public String getRanking() {
		return ranking;
	}

	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	
	
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBookImageURL() {
		return bookImageURL;
	}

	public void setBookImageURL(String bookImageURL) {
		this.bookImageURL = bookImageURL;
	}

	public String getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(String publicationYear) {
		this.publicationYear = publicationYear;
	}

	public String getVol() {
		return vol;
	}

	public void setVol(String vol) {
		this.vol = vol;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getRestVol() {
		return restVol;
	}

	public void setRestVol(String restVol) {
		this.restVol = restVol;
	}
}
