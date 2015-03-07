/*
 * c'est mon panier
 */
package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import domain.Produits;
import java.util.Map;

public class MonPanier {

    Map<String, Produits> hm = new HashMap<String, Produits>();

    public Produits getHm(String id) {
        return hm.get(id);
    }
    
    

    //ajoute produit dans mon cart
    public void ajouterProduit(String id) {
        System.out.println("fonc : ajouterProduit : id = "+id);
        if (hm.containsKey(id)) {
            Produits produitCart = hm.get(id);
            produitCart.setShoppingNum(produitCart.getShoppingNum() + 1);
        } else {
            hm.put(id, new ProduitsService().getProduitById(id));
        }
         System.out.println("fonc : ajouterProduit : produit = "+hm.get(id).getDescription());

    }

    //删除书
    public void supprimerProduit(String id) {
        hm.remove(id);
    }

    //更新书(对于购物车的更新)
    public void modifierProduit(String id, String nums) {
        //取id对应的book
        Produits book = hm.get(id);
        book.setShoppingNum(Integer.parseInt(nums));
    }

    //显示该购物车中的所有商品信息
    public ArrayList afficherMonPanier() {
        ArrayList al = new ArrayList();
        //遍历Hashmap
        Iterator itertor = hm.keySet().iterator();
        while (itertor.hasNext()) {
            //取出Key
            String key = (String) itertor.next();
            //取出book
            Produits produit = hm.get(key);
            al.add(produit);
        }

        return al;
    }

    public float getMontantTotal() {
        //得到总价
        float toltalPrice = 0.0f;
        Iterator iterator = hm.keySet().iterator();
        while (iterator.hasNext()) {
            //取出书号
            String noProduit = (String) iterator.next();
            //取出对应的值
            Produits produit = hm.get(noProduit);

            toltalPrice += produit.getPrix() * produit.getShoppingNum();
        }
        return toltalPrice;
    }

    //清空购物车
    public void viderMonPanier() {
        hm.clear();
    }
    
    public int quantiteProduit(){
        return(hm.size());
    }

}
