package service;

import java.util.ArrayList;
import domain.Produits;
import utils.SqlHelper;

public class ProduitsService {

    public Produits getProduitById(String id) {
        Produits produit = new Produits();
        String sql = "select * from Produits where noProduit=? and statut='1'";
        String paras[] = {id};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        if (al.size() == 1) {
            Object obj[] = (Object[]) al.get(0);
            produit.setNoProduit(Integer.parseInt(obj[0].toString()));
            produit.setDescription(obj[1].toString());
            produit.setPrix(Float.parseFloat(obj[2].toString()));
            produit.setQuantite(Integer.parseInt(obj[3].toString()));
            produit.setUniteMesure(obj[4].toString());
            produit.setCategorie(obj[5].toString());
            produit.setPhoto(obj[6].toString());
            produit.setStatut(obj[6].toString());

        }
        return produit;
    }

    public ArrayList<Produits> getTousProduits() {
        ArrayList<Produits> TousProduitTemp = new ArrayList<Produits>();
        String sql = "select * from Produits where 1=? and statut='1'";
        String[] paras = {"1"};
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Produits produit = new Produits();
            produit.setNoProduit(Integer.parseInt(obj[0].toString()));
            produit.setDescription(obj[1].toString());
            produit.setPrix(Float.parseFloat(obj[2].toString()));
            produit.setQuantite(Integer.parseInt(obj[3].toString()));
            produit.setUniteMesure(obj[4].toString());
            produit.setCategorie(obj[5].toString());
            produit.setPhoto(obj[6].toString());
            produit.setStatut(obj[7].toString());
            TousProduitTemp.add(produit);
        }
        return TousProduitTemp;
    }

    public ArrayList<Produits> getProduitParCertainsChamps(String[] champs, String[] paras) {
        ArrayList<Produits> certainsProduits = new ArrayList<Produits>();
        String champsTemp = "";
        for (int i = 0; i < champs.length; i++) {
            champsTemp += champs[i] + "=? and ";
        }
        String sql = "select * from Produits where " + champsTemp + "statut='1'";
        System.out.println(sql);
        for (int i = 0; i < paras.length; i++) {
            System.out.println(paras[i]);
        }
        ArrayList al = new SqlHelper().executeQuery(sql, paras);
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Produits produit = new Produits();
            produit.setNoProduit(Integer.parseInt(obj[0].toString()));
            produit.setDescription(obj[1].toString());
            produit.setPrix(Float.parseFloat(obj[2].toString()));
            produit.setQuantite(Integer.parseInt(obj[3].toString()));
            produit.setUniteMesure(obj[4].toString());
            produit.setCategorie(obj[5].toString());
            produit.setPhoto(obj[6].toString());
            produit.setStatut(obj[7].toString());
            certainsProduits.add(produit);
        }
        return certainsProduits;
    }

    public boolean ajouterProduit(Produits produitNouveau) {
        String sql = "insert into Produits(description,prix,quantite,unitemesure,categorie,photo,statut) values (?,?,?,?,?,?,?)";
        String[] paras = {produitNouveau.getDescription(), produitNouveau.getPrix() + "", produitNouveau.getQuantite() + "", produitNouveau.getUniteMesure(), produitNouveau.getCategorie(), produitNouveau.getPhoto(), "1"};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }

    public boolean modifierProduit(Produits produitModifier) {
        String sql = "update Produits set description=?,prix=?,quantite=?,unitemesure=?,categorie=?,photo=? where noProduit=? and statut='1'";
        String[] paras = {produitModifier.getDescription(), produitModifier.getPrix() + "", produitModifier.getQuantite() + "", produitModifier.getUniteMesure(), produitModifier.getCategorie(), produitModifier.getPhoto(), produitModifier.getNoProduit() + ""};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }

    public boolean supprimerProduitParNoProduit(String noProduit) {
        String sql = "update Produits set statut='0' where noProduit=? and statut='1'";
        String paras[] = {noProduit};
        boolean res = new SqlHelper().executeUpdate(sql, paras);
        return res;
    }
}
