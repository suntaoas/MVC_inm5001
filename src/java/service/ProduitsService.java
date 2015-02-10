package service;

import java.util.ArrayList;

import domain.Produits;
import domain.Clients;
import utils.SqlHelper;

public class ProduitsService {
	
	//selon noProduit et obtenir un produit
	public Produits getProduitById(String id){
		Produits produit=new Produits();
		String sql="select * from Produits where noProduit=? and flagSupprime='1'";
		String paras[]={id};
		ArrayList al=new SqlHelper().executeQuery(sql, paras);
		if(al.size()==1){
			Object obj[]=(Object[]) al.get(0);
		}
		return produit;
	}
	
	
	
	
	//obtenir touts les produuits
	public ArrayList getToutsProduits(){
		
		String sql="select * from Produits where 1=? and flagSupprime='1'";
		String[] paras={"1"};
		ArrayList al=new SqlHelper().executeQuery(sql, paras);
		//second encapsulation 
		ArrayList<Produits> newAl=new ArrayList<Produits>();
		for (int i = 0; i < al.size(); i++) {
			Object obj[]=(Object[]) al.get(i);
			Produits produit=new Produits();
                        produit.setNoProduit(obj[0].toString());
                        produit.setDescriptionProduit(obj[1].toString());
                        produit.setPrix(Float.parseFloat(obj[2].toString()));
                        produit.setQuantite(Integer.parseInt(obj[3].toString()));
                        produit.setCategorieProduit(obj[4].toString());
                        produit.setPhotoProduit(obj[5].toString());
                        produit.setFlagDisponibilite(obj[7].toString());
                        produit.setFlagSupprime(obj[6].toString());
			
			newAl.add(produit);

		}
		return newAl;
	}
}
