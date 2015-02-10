package domain;
//c'est un beans avec objet Produits

public class Produits {

    private String noProduit;
    private String descriptionProduit;
    private String categorieProduit;
    private float prix;
    private int quantite;
    private String photoProduit;
    private String flagSupprime;
    private String flagDisponibilite;
    private int shoppingNum = 1;//les quantites dans le cart

    public String getNoProduit() {
        return noProduit;
    }

    public String getDescriptionProduit() {
        return descriptionProduit;
    }

    public float getPrix() {
        return prix;
    }

    public int getQuantite() {
        return quantite;
    }

    public String getPhotoProduit() {
        return photoProduit;
    }

    public String getFlagSupprime() {
        return flagSupprime;
    }

    public String getFlagDisponibilite() {
        return flagDisponibilite;
    }

    public void setNoProduit(String noProduit) {
        this.noProduit = noProduit;
    }

    public void setDescriptionProduit(String descriptionProduit) {
        this.descriptionProduit = descriptionProduit;
    }

    public String getCategorieProduit() {
        return categorieProduit;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void setPhotoProduit(String photoProduit) {
        this.photoProduit = photoProduit;
    }

    public void setFlagSupprime(String flagSupprime) {
        this.flagSupprime = flagSupprime;
    }

    public void setFlagDisponibilite(String flagDisponibilite) {
        this.flagDisponibilite = flagDisponibilite;
    }

    public int getShoppingNum() {
        return shoppingNum;
    }

    public void setCategorieProduit(String categorieProduit) {
        this.categorieProduit = categorieProduit;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public void setShoppingNum(int shoppingNum) {
        this.shoppingNum = shoppingNum;
    }

}
