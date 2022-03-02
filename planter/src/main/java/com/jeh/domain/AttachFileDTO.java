package com.jeh.domain;

public class AttachFileDTO {
	// 파일 이름
	private String fileName;
	// 파일 경로
	private String uploadPath;
	// 파일의 새 이름 지정
	private String uuid;
	// 파일 타입(image or not)
	private boolean image;
	// notice table과 연결을 위해서
	private int nno;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	
	@Override
	public String toString() {
		return "AttachFileDTO [fileName=" + fileName + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", image="
				+ image + ", nno=" + nno + "]";
	}
	
	
	
}
