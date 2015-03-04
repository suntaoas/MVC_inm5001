/*
 *  cette classe fait des oprations SQL de BD pour obtenir des informations des commandes
 */

package service;

import java.sql.*;
import java.util.ArrayList;

import domain.Produits;
import domain.Clients;
import domain.Commandes;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import utils.*;

//处理与订单相关的业务逻辑
public class CommandesService {

    private Connection ct = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    //下单涉及到两张表
    public void submitOrder(MyCart myCart, Clients user) {

        String sql = "insert into commandes values(order_seq.nextval,?,?,sysdate)";
        //因为添加订单很复杂，因此我们不使用SQLHelper,而是专门针对下订单写对数据库的操作
        try {
            ct = DBUtil.getCon();
            //为了保证我们的订单号是稳定的，所以将我们的事务隔离级别升级（可串行）
            ct.setAutoCommit(false);
            ct.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

            ps = ct.prepareStatement(sql);
            ps.setInt(1, user.getNoClient());
            ps.setFloat(2, myCart.getTotalPrice());
            ps.executeUpdate();
            //如何得到刚刚插入的订单记录的订单号	
            sql = "select order_seq.currval from orders";//选择刚刚用的序列
            ps = ct.prepareStatement(sql);
            rs = ps.executeQuery();
            int orderId = 0;
            if (rs.next()) {

                //取出刚刚生成的订单号
                orderId = rs.getInt(1);
            }
            //把订单细节表生成（批量提交！！）
            ArrayList al = myCart.showMyCart();
            for (int i = 0; i < al.size(); i++) {
                Produits produit = (Produits) al.get(i);
                sql = "insert into orderitem values(orderitem_seq.nextval,?,?,?)";
                ps = ct.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setInt(2, produit.getNoProduit());
                ps.setInt(3, produit.getShoppingNum());
                ps.executeUpdate();
            }
            //整体提交
            ct.commit();

        } catch (Exception e) {

            //若失败，则回滚
            try {
                ct.rollback();
            } catch (SQLException e1) {
                // TODO 自动生成的 catch 块
                e1.printStackTrace();
                throw new RuntimeException(e.getMessage());
            }
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            DBUtil.close(rs, ps, ct);
        }

    }
    
    public ArrayList<Commandes> getCommandeParCertainsChamps(String[] champs, String[] paras) {
        ArrayList<Commandes> certainsCommandes = new ArrayList<Commandes>();
        String champsTemp = "";
        for (int i = 0; i < champs.length; i++) {
            champsTemp += champs[i] + "=? and ";
        }
        String sql = "select * from Commandes where " + champsTemp + "statut='1'";
        ArrayList al = new SqlHelper().executeQuery(sql, paras); 
        for (int i = 0; i < al.size(); i++) {
            Object obj[] = (Object[]) al.get(i);
            Commandes commande = new Commandes();
            commande.setNoCommande(Integer.parseInt(obj[0].toString()));
            commande.setDatetime(obj[1].toString());
            commande.setNoClient(obj[2].toString());
            commande.setMontant(Float.parseFloat(obj[3].toString()));
            commande.setPaiement(obj[4].toString());
            commande.setStatut(obj[5].toString());

            certainsCommandes.add(commande);
        }
        return certainsCommandes;
    }
}
