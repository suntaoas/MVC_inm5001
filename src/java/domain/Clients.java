package domain;
//c'est un beans avec objet Clients

public class Clients {

    private int noClient;
    private String nom;
    private String prenom;
    private String password;
    private int age;
    private String sexe;
    private String adresse;
    private String telephone;
    private String courriel;
    private String statut;
    private String usager;

    public Clients(int noClient, String password) {
        this.noClient = noClient;
        this.password = password;
    }

    public Clients(int noClient) {
        this.noClient = noClient;
    }

    public Clients() {
    }

    public int getNoClient() {
        return noClient;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getPassword() {
        return password;
    }

    public int getAge() {
        return age;
    }

    public String getSexe() {
        return sexe;
    }

    public String getAdresse() {
        return adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getCourriel() {
        return courriel;
    }

    public String getStatut() {
        return statut;
    }

    public String getUsager() {
        return usager;
    }

    public void setNoClient(int noClient) {
        this.noClient = noClient;
    }

    public void setNom(String nomClient) {
        this.nom = nomClient;
    }

    public void setPrenom(String prenomClient) {
        this.prenom = prenomClient;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public void setCourriel(String courriel) {
        this.courriel = courriel;
    }

    public void setStatut(String flagClient) {
        this.statut = flagClient;
    }

    public void setUsager(String flagSupprime) {
        this.usager = flagSupprime;
    }

}
