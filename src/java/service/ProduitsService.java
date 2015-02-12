/*
 *  cette classe fait des oprations SQL de BD pour obtenir des informations des produits
 */

package service;

import java.util.ArrayList;

import domain.Produits;
import utils.SqlHelper;

public class ProduitsService {
	
	//selon noProduit et obtenir un produit
	public Produits getProduitById(String id){
		Produits produit=new Produits();
		String sql="select * from Produits where noProduit=? and statut='1'";
		String paras[]={id};
		ArrayList al=new SqlHelper().executeQuery(sql, paras);
		if(al.size()==1){
			Object obj[]=(Object[]) al.get(0);
		}
		return produit;
	}	
	
	//obtenir touts les produuits
	public ArrayList getTousProduits(){
		
		String sql="select * from Produits where 1=? and statut='1'";
		String[] paras={"1"};
		ArrayList al=new SqlHelper().executeQuery(sql, paras);
		//second encapsulation 
		ArrayList<Produits> newAl=new ArrayList<Produits>();
		for (int i = 0; i < al.size(); i++) {
			Object obj[]=(Object[]) al.get(i);
			Produits produit=new Produits();
                        produit.setNoProduit(Integer.parseInt(obj[0].toString()));
                        produit.setDescription(obj[1].toString());
                        produit.setPrix(Float.parseFloat(obj[2].toString()));
                        produit.setQuantite(Integer.parseInt(obj[3].toString()));
                        produit.setCategorie(obj[4].toString());
                        produit.setPhoto(obj[5].toString());
                        produit.setStatut(obj[6].toString());
			
			newAl.add(produit);

		}
		return newAl;
	}
}
