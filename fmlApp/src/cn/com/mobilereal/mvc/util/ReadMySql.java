package cn.com.mobilereal.mvc.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReadMySql {


	/**
	 * @param args
	 */
	public static void main(String[] args) {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement(); // 通过连接创建(createStatement)一个语句对象,不是new
			rs = stmt.executeQuery("select * from ts_role"); // 执行查询,返回一个结果集rs相当于一个游标
			while (rs.next()) { // 循环取得结果集(遍历)
				System.out.println(rs.getString("b") + " "
						+ rs.getString("c") + " "
						+ rs.getString("d"));
			}
			
			getTableBean();

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally { // 不要忘了关闭
			try {
				if (conn != null) {
					conn.close();
					conn = null;
				}
				if (stmt != null) {
					stmt.close();
					stmt = null;
				}
				if (rs != null) {
					rs.close();
					rs = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fml?user=fml&password=fmlfml");
		return conn;
	}
	
	public static List<String> getAllTableName(Connection cnn) throws SQLException {
		  List<String> tables = new ArrayList<String>();  
		  DatabaseMetaData dbMetaData = cnn.getMetaData();  
		  //可为:"TABLE",   "VIEW",   "SYSTEM TABLE",    
		  //"GLOBAL TEMPORARY",   "LOCAL TEMPORARY","ALIAS","SYNONYM"  
		  String[] types = {"TABLE"};  
		  ResultSet tabs = dbMetaData.getTables(null, null, null, types);
		  while(tabs.next()){
			  //只要表名这一列  
			  tables.add(tabs.getString("TABLE_NAME"));  
		  }
		  System.out.println(tables);
		  return tables;  
	}
	
	public static List<Map<String, Object>> getTableBean() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Connection con = getConnection();
		List<String> tableNameList = getAllTableName(con);
		for (String tableName : tableNameList) {
			System.out.println("========tableName=========="+tableName);
			String sql = "select * from " + tableName;
			   Statement state = con.createStatement();
			   ResultSet rs = state.executeQuery(sql);
			   ResultSetMetaData rsmd = rs.getMetaData();
			   for(int i = 1; i <= rsmd.getColumnCount(); i++)
			   {
			        String colname = rsmd.getColumnName(i);
			        String typeName = rsmd.getColumnTypeName(i);
			        String lowerCase = colname.toLowerCase();
			        String newColName = "";
			        if (lowerCase.indexOf("_") > 0) {
			        	String[] split = lowerCase.split("_");
			        	for (int j=0;j<split.length;j++) {
			        		String s = split[j];
			        		if (j!=0) {
			        			String first = s.substring(0, 1);
			        			s = s.replaceFirst(first, first.toUpperCase());
			        		}
			        		newColName += s;
			        	}
			        } else {
			        	newColName = lowerCase;
			        }
			        System.out.println(newColName);
			   }
		}
		return null;
	}
	
	

}
