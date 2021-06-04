package Conexion_BD;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conexion {
    //variables de tipo private String 
   private String db="proyecto" ; 
   private String user="root";
   private String Password="";
   private String url="jdbc:mysql://localhost/"+db;
   private Connection conn= null;
   
   public Conexion (){
       this.url="jdbc:mysql://localhost:3306/"
               + "proyecto?serverTunezone=UTC"; 
       
       try{
           // El llamado de las librerias
           Class.forName("com.mysql.jdbc.Driver");
           conn=DriverManager.getConnection(this.url,this.user, this.Password);
           if(conn!=null){
               System.out.println("Se ha conectado a la"
                       +  "base de datos"+db+ " Bienvenido");
           }
       }catch (SQLException e){
           System.err.println(e.getMessage());
           
       }catch (ClassNotFoundException e){
           System.out.println(e.getMessage());
       }
   }
   
   
   public Connection obtenerConexion (){
       
       return conn;
   }
}
