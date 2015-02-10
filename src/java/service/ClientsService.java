package service;

import domain.Clients;
import java.util.ArrayList;

import utils.SqlHelper;

public class ClientsService {

    //le fonction pour verifier usage legal.
    public boolean checkUser(Clients user) {
        System.out.println("connection de BD");
        //verifier le donnee sur le BD
        String sql = "select * from clients where noClient=? and password=? and flagSupprime=1";
        String paras[] = {user.getNoClient() + "", user.getPassword()};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        if (al.size() == 0) {
            return false;
        } else {
            Object[] objects = (Object[]) al.get(0);
            //prendre les informations dans le objet user.
            for (int i = 0; i < 11; i++) {
                System.out.println(objects[i]);
            }
            user.setNoClient((String) objects[0]);
            user.setNomClient((String) objects[1]);
            user.setPrenomClient((String) objects[2]);
            user.setPassword((String) objects[3]);
            user.setAge(Integer.parseInt(objects[4].toString()));
            user.setSexe((String) objects[5]);
            user.setAdresse((String) objects[6]);
            user.setTelephone((String) objects[7]);
            user.setCourriel((String) objects[8]);
            user.setFlagClient((String) objects[9]);
            user.setFlagSupprime((String) objects[10]);
            System.out.println(user.getNoClient());
            System.out.println(user.getPrenomClient());
            System.out.println(user.getCourriel());
            return true;
        }

    }
}
