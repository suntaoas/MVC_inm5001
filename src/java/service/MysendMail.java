package service;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class MysendMail {

    private MimeMessage mimeMsg;
    private Session session;
    private Properties props;
    private boolean needAuth = false;
    private String username = "";
    private String password = "";
    private Multipart mp;

    public MysendMail() {
        createMimeMessage();
    }

    public MysendMail(String smtp) {
        setSmtpHost(smtp);
        createMimeMessage();
    }

    public void setSmtpHost(String hostName) {

        System.out.println("mail.smtp.host = " + hostName);
        if (props == null) {
            props = System.getProperties();
        }

        props.put("mail.smtp.host", hostName);

    }

    public boolean createMimeMessage() {
        try {
            System.out.println("obtenir l'objet pour Mime Message ! ");
            session = Session.getDefaultInstance(props, null);
        } catch (Exception e) {
            System.err.println("error pour obtenir l'objet pour Mime Message" + e);
            return false;
        }

        System.out.println("creer l'objet MiMe");

        try {

            mimeMsg = new MimeMessage(session);
            mp = new MimeMultipart();

            return true;

        } catch (Exception e) {

            System.err.println("error pour creer l'objet MiMe" + e);
            return false;
        }
    }

    public void setNeedAuth(boolean need) {

        System.out.println("smtp : mail.smtp.auth = " + need);
        if (props == null) {
            props = System.getProperties();
        }

        if (need) {

            props.put("mail.smtp.auth", "true");
        } else {

            props.put("mail.smtp.auth", "false");
        }
    }

    public void setNamePass(String name, String pass) {
        username = name;
        password = pass;
    }

    public boolean setSubject(String mailSubject) {
        System.out.println("set mail title");
        try {
            mimeMsg.setSubject(mailSubject);
            return true;
        } catch (Exception e) {
            System.err.println("error pour set mail title");
            return false;
        }
    }

    public boolean setBody(String mailBody) {
        try {
            BodyPart bp = new MimeBodyPart();
            bp.setContent("<meta http-equiv=Content-Type content=text/html; charset=gb2312>" + mailBody, "text/html;charset=GB2312");
            mp.addBodyPart(bp);

            return true;
        } catch (Exception e) {
            System.err.println("error pour body de l'objet mail" + e);
            return false;
        }
    }

    public boolean addFileAffix(String filename) {

        System.out.println("ajouter l'accessoire" + filename);

        try {
            BodyPart bp = new MimeBodyPart();
            FileDataSource fileds = new FileDataSource(filename);
            bp.setDataHandler(new DataHandler(fileds));
            bp.setFileName(fileds.getName());

            mp.addBodyPart(bp);

            return true;
        } catch (Exception e) {
            System.err.println("ajouter l'accessoire" + filename + "error" + e);
            return false;
        }
    }

    public boolean setFrom(String from) {
        System.out.println("sender");
        try {
            mimeMsg.setFrom(new InternetAddress(from));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean setTo(String to) {
        if (to == null) {
            return false;
        }

        try {
            mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public boolean setCopyTo(String copyto) {
        if (copyto == null) {
            return false;
        }
        try {
            mimeMsg.setRecipients(Message.RecipientType.CC, (Address[]) InternetAddress.parse(copyto));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean sendout() {
        try {
            mimeMsg.setContent(mp);
            mimeMsg.saveChanges();
            System.out.println("envoyer le courriel ...");

            Session mailSession = Session.getInstance(props, null);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect((String) props.get("mail.smtp.host"), username, password);
            transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));

            System.out.println("envoyer le courriel fini !!");
            transport.close();

            return true;
        } catch (Exception e) {

            System.err.println("envoyer le courriel error" + e);
            return false;
        }

    }

}
