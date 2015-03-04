package domain;

import java.util.Date;

public class Commandes {
    private int noCommande;
    private Date date;
    private String noClient;
    private float montant;
    private String paiement;
    private String statut;

    public Commandes(int noCommande) {
        this.noCommande = noCommande;
    }

    public int getNoCommande() {
        return noCommande;
    }

    public Date getDate() {
        return date;
    }

    public String getNoClient() {
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

    public void setNoCommande(int noCommande) {
        this.noCommande = noCommande;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setNoClient(String noClient) {
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
    
    
}
