/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Erasmo E. Leal
 */
public class MailUtilLocal {
    public static void sendMail(String to, String from, String subject, String body, boolean bodyIsHTML) throws MessagingException{
       Properties props = new Properties();
       props.put("mail.transport.protocol", "smtps");
       props.put("mail.smtps.host", "smtp.mail.yahoo.com");
       props.put("mail.smtps.port", 465);
       props.put("mail.smtps.auth", "true");
       Session session = Session.getDefaultInstance(props);
       session.setDebug(true);
       Message message = new MimeMessage(session);
       message.setSubject(subject);
       if(bodyIsHTML)
           message.setContent(body, "text/html");
       else
           message.setText(body);
       Address fromAddress = new InternetAddress(from);
       Address toAddress = new InternetAddress(to);
       message.setFrom(fromAddress);
       message.setRecipient(Message.RecipientType.TO, toAddress);
       
       Transport transport = session.getTransport();
       transport.connect("erasmo_eli", "amigo2012");
       transport.sendMessage(message, message.getAllRecipients());
       transport.close();
    }
}
