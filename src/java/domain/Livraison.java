package domain;

public class Livraison {

    private int noLivraison;
    private int noCommande;
    private String dateLivraison;

    public Livraison() {

    }

    public int getNoLivraison() {
        return noLivraison;
    }

    public int getNoCommande() {
        return noCommande;
    }

    public String getDateLivraison() {
        return dateLivraison;
    }

    public void setNoLivraison(int noLivraison) {
        this.noLivraison = noLivraison;
    }

    public void setNoCommande(int noCommande) {
        this.noCommande = noCommande;
    }

    public void setDateLivraison(String dateLivraison) {
        this.dateLivraison = dateLivraison;
    }

}
