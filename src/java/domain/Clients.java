package domain;
//c'est un beans avec objet Clients

public class Clients {

    private String noClient;
    private String nomClient;
    private String prenomClient;
    private String password;
    private int age;
    private String sexe;
    private String adresse;
    private String telephone;
    private String courriel;
    private String flagClient;
    private String flagSupprime;

    public Clients(String noClient, String password) {
        this.noClient = noClient;
        this.password = password;
    }

    public Clients(String noClient) {
        this.noClient = noClient;
    }

    public Clients() {
    }

    public String getNoClient() {
        return noClient;
    }

    public String getNomClient() {
        return nomClient;
    }

    public String getPrenomClient() {
        return prenomClient;
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

    public String getFlagClient() {
        return flagClient;
    }

    public String getFlagSupprime() {
        return flagSupprime;
    }

    public void setNoClient(String noClient) {
        this.noClient = noClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public void setPrenomClient(String prenomClient) {
        this.prenomClient = prenomClient;
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

    public void setFlagClient(String flagClient) {
        this.flagClient = flagClient;
    }

    public void setFlagSupprime(String flagSupprime) {
        this.flagSupprime = flagSupprime;
    }

}
