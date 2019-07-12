package org.protectedog.service.domain;

public class FileDog {

	private int fileNo;
	private String boardCode;
	private int postNo;
	private String fileName;
	private int fileCode;

	
	public FileDog() {
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileCode() {
		return fileCode;
	}

	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}

	@Override
	public String toString() {
		return "FileUpload [fileNo=" + fileNo + ", boardCode=" + boardCode + ", postNo=" + postNo + ", fileName="
				+ fileName + ", fileCode=" + fileCode + "]";
	}

}
