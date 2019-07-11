package org.protectedog.service.domain;

import java.util.Date;

public class Message {

	///Field
	//Message DB
	private int messageNo;
	private String messageTitle;
	private String messageContent;
	private Date sendDate;
	private Date receiveDate;
	private String messageStatus;
	private User sender;
	private User receiver;
	private String delCode;

	
	///Constructor
	
	///Method
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getMessageStatus() {
		return messageStatus;
	}
	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	
	public String getDelCode() {
		return delCode;
	}
	public void setDelCode(String delCode) {
		this.delCode = delCode;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageTitle=" + messageTitle + ", messageContent="
				+ messageContent + ", sendDate=" + sendDate + ", receiveDate=" + receiveDate + ", messageStatus="
				+ messageStatus + ", sender=" + sender + ", receiver=" + receiver + ", delCode=" + delCode + "]";
	}

	
	
	
}
