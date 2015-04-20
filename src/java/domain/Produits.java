package domain;

public class Produits {

    private int noProduit;
    private String description;
    private float prix;
    private int quantite;
    private String uniteMesure;
    private String categorie;
    private String photo;
    private String statut;

    private int shoppingNum = 1;

    public int getNoProduit() {
        return noProduit;
    }

    public String getDescription() {
        return description;
    }

    public float getPrix() {
        return prix;
    }

    public int getQuantite() {
        return quantite;
    }

    public String getUniteMesure() {
        return uniteMesure;
    }

    public String getCategorie() {
        return categorie;
    }

    public String getPhoto() {
        return photo;
    }

    public String getStatut() {
        return statut;
    }

    public void setNoProduit(int noProduit) {
        this.noProduit = noProduit;
    }

    public void setDescription(String descriptionProduit) {
        this.description = descriptionProduit;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void setPhoto(String photoProduit) {
        this.photo = photoProduit;
    }

    public void setStatut(String flagSupprime) {
        this.statut = flagSupprime;
    }

    public int getShoppingNum() {
        return shoppingNum;
    }

    public void setCategorie(String categorieProduit) {
        this.categorie = categorieProduit;
    }

    public void setUniteMesure(String unitemesure) {
        this.uniteMesure = unitemesure;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public void setShoppingNum(int shoppingNum) {
        this.shoppingNum = shoppingNum;
    }

}
