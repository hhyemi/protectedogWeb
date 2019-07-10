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
	private User receiver1;
	private User receiver2;
	private User receiver3;
	private User receiver4;
	private User receiver5;
	private User receiver6;
	private User receiver7;
	private User receiver8;
	private User receiver9;
	private User receiver10;
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
	public User getReceiver1() {
		return receiver1;
	}
	public void setReceiver1(User receiver1) {
		this.receiver1 = receiver1;
	}
	public User getReceiver2() {
		return receiver2;
	}
	public void setReceiver2(User receiver2) {
		this.receiver2 = receiver2;
	}
	public User getReceiver3() {
		return receiver3;
	}
	public void setReceiver3(User receiver3) {
		this.receiver3 = receiver3;
	}
	public User getReceiver4() {
		return receiver4;
	}
	public void setReceiver4(User receiver4) {
		this.receiver4 = receiver4;
	}
	public User getReceiver5() {
		return receiver5;
	}
	public void setReceiver5(User receiver5) {
		this.receiver5 = receiver5;
	}
	public User getReceiver6() {
		return receiver6;
	}
	public void setReceiver6(User receiver6) {
		this.receiver6 = receiver6;
	}
	public User getReceiver7() {
		return receiver7;
	}
	public void setReceiver7(User receiver7) {
		this.receiver7 = receiver7;
	}
	public User getReceiver8() {
		return receiver8;
	}
	public void setReceiver8(User receiver8) {
		this.receiver8 = receiver8;
	}
	public User getReceiver9() {
		return receiver9;
	}
	public void setReceiver9(User receiver9) {
		this.receiver9 = receiver9;
	}
	public User getReceiver10() {
		return receiver10;
	}
	public void setReceiver10(User receiver10) {
		this.receiver10 = receiver10;
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
				+ messageContent + ", toString()="+ super.toString() + "]";
	}
	
	
	
}
