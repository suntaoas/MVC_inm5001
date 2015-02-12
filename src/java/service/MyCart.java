/*
 * c'est mon cart
 */

package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import domain.Produits;


public class MyCart {
	HashMap<String, Produits> hm=new HashMap<String, Produits>();
	
	//ajoute produit dans mon cart
	public void ajouterProduit(String id){
		if (hm.containsKey(id)) {
			Produits produitCart=hm.get(id);
			produitCart.setShoppingNum(produitCart.getShoppingNum()+1);
		}else{
			hm.put(id, new ProduitsService().getProduitById(id));
		}
		
	}
		
	//删除书
	public void del(String id){
		hm.remove(id);
	}
	
	//更新书(对于购物车的更新)
	public void updateBook(String id,String nums){
		//取id对应的book
		Produits book=hm.get(id);
		book.setShoppingNum(Integer.parseInt(nums));
	}
	
	//显示该购物车中的所有商品信息
	public ArrayList showMyCart(){
		ArrayList al=new ArrayList();
		//遍历Hashmap
		Iterator itertor=hm.keySet().iterator();
		while(itertor.hasNext()){
			//取出Key
			String key=(String) itertor.next();
			//取出book
			Produits book=hm.get(key);
			al.add(book);
		}
		
		return al;
	}
	
	
	public float getTotalPrice()
	{
		//得到总价
		float toltalPrice=0.0f;
		Iterator iterator=hm.keySet().iterator();
		while(iterator.hasNext()){
			//取出书号
			String noProduit=(String) iterator.next();
			//取出对应的值
			Produits produit=hm.get(noProduit);
			
			toltalPrice+=produit.getPrix()*produit.getShoppingNum();
		}
		return toltalPrice;
	}
	//清空购物车
	public void clearBook(){
		hm.clear();
	}
	
}
