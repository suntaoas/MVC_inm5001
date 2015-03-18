/*
 *  cette classe fait des oprations SQL de BD pour obtenir des informations des commandes
 */
package service;

import java.sql.*;
import java.util.ArrayList;

import domain.Produits;
import domain.Clients;
import domain.Commandes;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import utils.*;

public class CommandesService {

    private Connection ct = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int ajouterCommande(MonPanier monpanier, Commandes nouveauCommande) {
        System.out.println("CommandeService.java------noClient, datetime , MontantTotal :" + nouveauCommande.getNoClient() + "---" + nouveauCommande.getDatetime() + "---" + monpanier.getMontantTotal());
        String sql = "insert into commandes(datetime,noClient,montant,paiement,statut) values(?,?,?,'0','1')";
        //String sql = "insert into commandes(datetime,noClient,montant,paiement,statut) values('2015-34-09 00:34:46',3,3.00,'0','1')";

        try {
            ct = DBUtil.getCon();
            ct.setAutoCommit(false);
            ct.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

            ps = ct.prepareStatement(sql);
            ps.setString(1, nouveauCommande.getDatetime());
            ps.setInt(2, nouveauCommande.getNoClient());
            ps.setFloat(3, monpanier.getMontantTotal());
            ps.executeUpdate();
            sql = "select MAX(noCommande) from Commandes";
            ps = ct.prepareStatement(sql);
            rs = ps.executeQuery();
            int orderId = 0;
            //rs = ps.getGeneratedKeys();
            if (rs.next()) {

                orderId = rs.getInt(1);
            }
            ArrayList al = monpanier.afficherMonPanier();
            for (int i = 0; i < al.size(); i++) {
                Produits produit = (Produits) al.get(i);

                sql = "insert into DetailCommande values(?,?,?,?,?)";

                ps = ct.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setInt(2, produit.getNoProduit());
                ps.setFloat(3, produit.getPrix());
                ps.setInt(4, produit.getShoppingNum());
                ps.setFloat(5, produit.getShoppingNum() * produit.getPrix());
                ps.executeUpdate();
            }
            ct.commit();
            return orderId;
        } catch (Exception e) {

            try {
                ct.rollback();
            } catch (SQLException e1) {
                // TODO 自动生成的 catch 块
                e1.printStackTrace();
                throw new RuntimeException(e.getMessage());
                
            }
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            DBUtil.close(rs, ps, ct);
        }
        return -1;
    }

    public ArrayList<Commandes> getCommandeParCertainsChamps(String[] champs, String[] paras) {
        ArrayList<Commandes> certainsCommandes = new ArrayList<Commandes>();
        String champsTemp = "";
        for (int i = 0; i < champs.length; i++) {
            champsTemp += champs[i] + "=? and ";
        }
        String sql = "select * from Commandes where " + champsTemp + "1='1'";
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

    public ArrayList<Commandes> getTousCommandes() {
        ArrayList<Commandes> certainsCommandes = new ArrayList<Commandes>();
        String champsTemp = "";

        return certainsCommandes;
    }

    public ArrayList<DetailCommande> getDetailParNoCommande(String noCommande) {
        ArrayList<DetailCommande> arrDetailCommande = new ArrayList<DetailCommande>();
        String sql = "select * from DetailCommande where noCommande=?";
        String paras[] = {noCommande};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            DetailCommande detailCommande = new DetailCommande();
            detailCommande.setNoCommande(Integer.parseInt(obj[0].toString()));
            detailCommande.setNoProduit(Integer.parseInt(obj[1].toString()));
            detailCommande.setPrixProduit(Float.parseFloat(obj[2].toString()));
            detailCommande.setQuantiteProduit(Integer.parseInt(obj[3].toString()));
            detailCommande.setMontantProduit(Float.parseFloat(obj[4].toString()));
            
            arrDetailCommande.add(detailCommande);
        }
        return arrDetailCommande;
    }
    
    public Clients getCommandeById(String noCommande) {
        String sql = "select * from Clients where noClient=? and statut='1'";
        String paras[] = {noCommande};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        Clients client = new Clients();
        if (al.size() == 1) {
            Object obj[] = (Object[]) al.get(0);
            client.setNoClient(Integer.parseInt(obj[0].toString()));
            client.setNom(obj[1].toString());
            client.setPrenom(obj[2].toString());
            client.setPassword(obj[3].toString());
            client.setAge(Integer.parseInt(obj[4].toString()));
            client.setSexe(obj[5].toString());
            client.setAdresse(obj[6].toString());
            client.setTelephone(obj[7].toString());
            client.setCourriel(obj[8].toString());
            client.setStatut(obj[9].toString());
            client.setUsager(obj[10].toString());
        }
        return client;
    }
    
    public boolean supprimerCommande(String commande){
        String sql = "update Commandes set statut='0' where noCommande=? and statut='1'";
        String[] paras = {commande};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }
    
    public boolean payerCommande(String commande){
        String sql = "update Commandes set paiement='1' where noCommande=? and statut='1' and paiement='0'";
        String[] paras = {commande};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }
}
