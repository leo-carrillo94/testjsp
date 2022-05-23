package co.empresa.test.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionMySQL {
	private Connection con = null;
	//para el patron singleton=>
	private static ConexionMySQL db;
	
	private PreparedStatement preparedStatement;
	
	private static final String url= "jdbc:mysql://localhost:3306/";
	private static final String dbName = "sistema";
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String userName= "root";
	private static final String password= "";
	
	public ConexionMySQL() {
		try
        {
            Class.forName(driver).newInstance();
             con = (Connection)DriverManager.getConnection(url+dbName+"?serverTimezone=UTC",userName,password); 
        }catch(InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException  e){
            e.printStackTrace();
        }catch(Exception e) {
        	e.printStackTrace();
        }		
	}
	
	public void cerrarConexion() {
		try {
			con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ConexionMySQL getConexion() {
		if(db == null) {
			db = new ConexionMySQL();
			
		}
		return db;
	}
	
	
	
	//metodo de Consulta
	public ResultSet query() throws SQLException{
		ResultSet res = preparedStatement.executeQuery();
		return res;
	}
	//metodo de ejecucion
	public int execute() throws SQLException{
		int result = preparedStatement.executeUpdate();
		return result;
	}
	
	//metodo para obtener la conexion
	public Connection getCon() {
		return this.con;
	}
	
	//para inicializar el preparedStatement
	public PreparedStatement setPreparedStatement(String sql) throws SQLException{
		this.preparedStatement = con.prepareStatement(sql);
		return this.preparedStatement;
	}
}

