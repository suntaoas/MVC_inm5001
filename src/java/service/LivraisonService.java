package service;

import domain.Commandes;
import domain.Livraison;
import java.util.ArrayList;
import utils.SqlHelper;

public class LivraisonService {

    public boolean ajouterLivraison(String noCommande, String datetime) {
        String sql = "insert into Livraison(noCommande,dateLivraison) values (?,?)";
        String[] paras = {noCommande, datetime};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }

    public ArrayList<Commandes> getCommandePourLivraison(String[] champs, String[] paras) {
        ArrayList<Commandes> certainsCommandes = new ArrayList<Commandes>();
        String champsTemp = "";
        for (int i = 0; i < champs.length; i++) {
            champsTemp += champs[i] + "=? and ";
        }
        String sql = "select * from Commandes where " + champsTemp + "1='1' and noCommande not in (select noCommande from Livraison)";
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Commandes commande = new Commandes();
            commande.setNoCommande(Integer.parseInt(obj[0].toString()));
            commande.setDatetime(obj[1].toString());
            commande.setNoClient(Integer.parseInt(obj[2].toString()));
            commande.setMontant(Float.parseFloat(obj[3].toString()));
            commande.setPaiement(obj[4].toString());
            commande.setStatut(obj[5].toString());
            certainsCommandes.add(commande);
        }
        return certainsCommandes;
    }

    public ArrayList<Livraison> getTousLivraisons() {
        ArrayList<Livraison> TousLivraisonTemp = new ArrayList<Livraison>();
        String sql = "select * from Livraison where 1=?";
        String[] paras = {"1"};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Livraison livraison = new Livraison();
            livraison.setNoLivraison(Integer.parseInt(obj[0].toString()));
            livraison.setNoCommande(Integer.parseInt(obj[1].toString()));
            livraison.setDateLivraison(obj[2].toString());
            TousLivraisonTemp.add(livraison);
        }
        return TousLivraisonTemp;
    }

}
