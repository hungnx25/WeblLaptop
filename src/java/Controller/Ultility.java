/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAL.CusDAO;
import DAL.ProDAO;
import Models.Customers;
import Models.Products;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class Ultility {

    CusDAO cusDao = new CusDAO();
    ProDAO pdao = new ProDAO();

    public Products checkId(String id) {
        for (Products p : pdao.getProductList()) {
            if (p.getId().equals(id)) {
                return p;
            }
        }
        return null;
    }

    public Customers checkLogName(String logName) {
        for (Customers cus : cusDao.getCustomerList()) {
            if (cus.getLoginName().equals(logName)) {
                return cus;
            }
        }
        return null;
    }

    public Customers checkEmail(String email) {
        for (Customers cus : cusDao.getCustomerList()) {
            if (cus.getEmail().equals(email)) {
                return cus;
            }
        }
        return null;
    }

    public Customers checkForgotPass(String logName, String email, int quesId, String ans) {
        for (Customers cus : cusDao.getCustomerList()) {
            if (cus.getLoginName().equals(logName) && cus.getQuestionId() == quesId
                    && cus.getEmail().equals(email)) {
                return cus;
            }
        }
        return null;
    }

    public Customers checkPass(String logName, String pass) {
        for (Customers cus : cusDao.getCustomerList()) {
            if (cus.getLoginName().equals(logName) && cus.getPassword().equals(pass)) {
                return cus;
            }
        }
        return null;
    }

    //^0[913]{1}\\d{8}$
    public Boolean checkPara(String para, String regex) {
        if (para.matches(regex)) {
            return true;
        } else {
            return false;
        }
    }

    public int codeVerify() {
        Random generator = new Random();
        int code = (int) Math.floor(((Math.random() * 899999) + 100000));
        return code;
    }

    public static void sendEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setText(message);

        // sends the e-mail
        Transport.send(msg);

    }

    public static String RandomPass() {
        // ASCII range – alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 8; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }

        return sb.toString();
    }

}
