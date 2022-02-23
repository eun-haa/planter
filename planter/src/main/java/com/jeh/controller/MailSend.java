package com.jeh.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSend {
	public String mailSend(String email, String passwd, String random_pw) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//Gmail 계정 및 Password 정보가 들어가는 곳
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("deveunhatest@gmail.com", "eunha220223@");
			}
		});
		
		//실제 메일 작성
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setSentDate(new Date());  //보내는 시간
			msg.setFrom(new InternetAddress("deveunhatest@gmail.com", "planter")); //보내는 사람
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);   //수신인 설정
			msg.setSubject("[planter] 임시 비밀번호"); //제목
			msg.setContent("<h1>안녕하세요.</h1><h3>회원님의 임시 비밀번호는 ["+random_pw+"] 입니다.</h3>"
					+ "<h3></h3>", "text/html; charset=UTF-8");
			Transport.send(msg);  //전송
			;
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return passwd;
	}
}


