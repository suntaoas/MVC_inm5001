package service;

public class SendMailToSomeone {

    public void send(String title, String mailbody, String sendTo, String from, String passwd, String sendStmp) {

        MysendMail themail = new MysendMail("smtp.sohu.com");

        themail.setNeedAuth(true);

        if (themail.setSubject(title) == false) {
            return;
        }

        if (themail.setBody(mailbody) == false) {
            return;
        }

        if (themail.setTo(sendTo) == false) {
            return;
        }

        if (themail.setFrom("inm5001@sohu.com") == false) {
            return;
        }

        themail.setNamePass("inm5001", "qwer@1234");

        if (themail.sendout() == false) {
            return;
        }
    }
}
