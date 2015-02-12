/*
*cette classe fait connection de BD pour les clients
*/
package service;

import domain.Clients;
import java.util.ArrayList;

import utils.SqlHelper;

public class ClientsService {

    //le fonction pour verifier usage legal.
    public boolean verifierClient(Clients client) {
        System.out.println("connection de BD");
        //verifier le donnee sur le BD
        String sql = "select * from clients where noClient=? and password=? and flagSupprime=1";
        String paras[] = {client.getNoClient() + "", client.getPassword()};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        if (al.size() == 0) {
            return false;
        } else {
            Object[] objects = (Object[]) al.get(0);
            //prendre les informations dans le objet user.
            for (int i = 0; i < 11; i++) {
                System.out.println(objects[i]);
            }
            client.setNoClient((String) objects[0]);
            client.setNomClient((String) objects[1]);
            client.setPrenomClient((String) objects[2]);
            client.setPassword((String) objects[3]);
            client.setAge(Integer.parseInt(objects[4].toString()));
            client.setSexe((String) objects[5]);
            client.setAdresse((String) objects[6]);
            client.setTelephone((String) objects[7]);
            client.setCourriel((String) objects[8]);
            client.setFlagClient((String) objects[9]);
            client.setFlagSupprime((String) objects[10]);
            System.out.println(client.getNoClient());
            System.out.println(client.getPrenomClient());
            System.out.println(client.getCourriel());
            return true;
        }

    }

    public ArrayList<Clients> getTousClients() {
        ArrayList<Clients> TousClientTemp = new ArrayList<Clients>();
        String sql = "select * from Clients where 1=? and flagSupprime='1'";
        String[] paras = {"1"};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        //second encapsulation 
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Clients client = new Clients();
            client.setNoClient(obj[0].toString());
            client.setNomClient(obj[1].toString());
            client.setPrenomClient(obj[2].toString());
            client.setPassword(obj[3].toString());
            client.setAge(Integer.parseInt(obj[4].toString()));
            client.setSexe(obj[5].toString());
            client.setAdresse(obj[6].toString());
            client.setTelephone(obj[7].toString());
            client.setCourriel(obj[8].toString());
            client.setFlagClient(obj[9].toString());
            client.setFlagSupprime(obj[10].toString());

            TousClientTemp.add(client);
        }
        return TousClientTemp;
    }
}
