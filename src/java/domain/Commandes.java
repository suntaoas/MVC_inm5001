package domain;

public class Commandes {

    private int noCommande;
    private String datetime;
    private int noClient;
    private float montant;
    private String paiement;
    private String statut;
    private int noLivraison;
    private String dateLivraison;

    public Commandes(int noCommande) {
        this.noCommande = noCommande;
    }

    public Commandes() {
    }

    public int getNoCommande() {
        return noCommande;
    }

    public String getDatetime() {
        return datetime;
    }

    public int getNoClient() {
        return noClient;
    }

    public float getMontant() {
        return montant;
    }

    public String getPaiement() {
        return paiement;
    }

    public String getStatut() {
        return statut;
    }

    public int getNoLivraison() {
        return noLivraison;
    }

    public String getDateLivraison() {
        return dateLivraison;
    }

    public void setNoCommande(int noCommande) {
        this.noCommande = noCommande;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public void setNoClient(int noClient) {
        this.noClient = noClient;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public void setPaiement(String paiement) {
        this.paiement = paiement;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public void setNoLivraison(int noLivraison) {
        this.noLivraison = noLivraison;
    }

    public void setDateLivraison(String dateLivraison) {
        this.dateLivraison = dateLivraison;
    }

}
