package service;

public class DetailCommande {
    private int noCommande;
    private int noProduit;
    private float prixProduit;
    private int quantiteProduit;
    private float montantProduit;

    public DetailCommande() {
        
    }

    public int getNoCommande() {
        return noCommande;
    }

    public int getNoProduit() {
        return noProduit;
    }

    public float getPrixProduit() {
        return prixProduit;
    }

    public int getQuantiteProduit() {
        return quantiteProduit;
    }

    public float getMontantProduit() {
        return montantProduit;
    }

    public void setNoCommande(int noCommande) {
        this.noCommande = noCommande;
    }

    public void setNoProduit(int noClient) {
        this.noProduit = noClient;
    }

    public void setPrixProduit(float prixProduit) {
        this.prixProduit = prixProduit;
    }

    public void setQuantiteProduit(int quantiteProduit) {
        this.quantiteProduit = quantiteProduit;
    }

    public void setMontantProduit(float montantProduit) {
        this.montantProduit = montantProduit;
    }
    
}
