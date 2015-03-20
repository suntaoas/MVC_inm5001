/*
 * c'est mon panier
 */
package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import domain.Produits;
import java.text.DecimalFormat;
import java.util.Map;

public class MonPanier {
    
    //float montantTotal;
    Map<String, Produits> hm = new HashMap<String, Produits>();

    public Produits getHm(String id) {
        return hm.get(id);
    }
    
    

    //ajoute produit dans mon cart
    public void ajouterProduit(String id, int nombreProduit) {
        System.out.println("fonc : ajouterProduit : id = "+id);
        Produits produitCart = new Produits();
        if (hm.containsKey(id)) {
            produitCart = hm.get(id);
            produitCart.setShoppingNum(nombreProduit);
        } else {
            ProduitsService produitservice = new ProduitsService();
            produitCart = produitservice.getProduitById(id);
            produitCart.setShoppingNum(nombreProduit);
            hm.put(id, produitCart);
        }
         System.out.println("fonc : ajouterProduit : produit = "+hm.get(id).getDescription());

    }


    public void supprimerProduit(String id) {
        hm.remove(id);
    }


    public void modifierProduit(String id, int nums) {

        Produits book = hm.get(id);
        book.setShoppingNum(nums);
    }


    public ArrayList afficherMonPanier() {
        ArrayList al = new ArrayList();

        Iterator itertor = hm.keySet().iterator();
        while (itertor.hasNext()) {

            String key = (String) itertor.next();

            Produits produit = hm.get(key);
            al.add(produit);
        }

        return al;
    }

    public float getMontantTotal() {

        float toltalPrice = 0.0f;
        Iterator iterator = hm.keySet().iterator();
        while (iterator.hasNext()) {

            String noProduit = (String) iterator.next();
            System.out.println("MonPanier.java------ getMmontantTotal()-----noProduit :"+noProduit);

            Produits produit = hm.get(noProduit);

            toltalPrice += produit.getPrix() * produit.getShoppingNum();
        }
        DecimalFormat df = new DecimalFormat("#.00");
        toltalPrice = Float.parseFloat(df.format(toltalPrice));
        return toltalPrice;
    }


    public void viderMonPanier() {
        hm.clear();
    }
    
    public int quantiteProduit(){
        return(hm.size());
    }

}
