package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Vene;

public class Dao { 
	private Connection con=null;
	private ResultSet rs = null;
	private PreparedStatement stmtPrep=null; 
	private String sql;
	
	private Connection yhdista(){
    	Connection con = null;    	        	
    	String JDBCAjuri = "org.mariadb.jdbc.Driver";
    	String url = "jdbc:mariadb://localhost:3306/a1800590";        	
    	try {
	         Class.forName(JDBCAjuri);
	         con = DriverManager.getConnection(url,"a1800590", "paQEeV36b");	        
	     }catch (Exception e){	         
	        e.printStackTrace();	         
	     }
	     return con;
	}
	
//KIRJAUTUMINEN
	public String login(String user_id, String password){
		String name=null;
		sql="SELECT name FROM login WHERE user_id=? AND password=?";						  
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, user_id);
			stmtPrep.setString(2, password);
    		rs = stmtPrep.executeQuery();  
    		if(rs.isBeforeFirst()){ //jos tunnus on käytössä
    			rs.next();
    			name=rs.getString("name");
    			con.close();        			
			}		
		} catch (SQLException e) {				
			e.printStackTrace();			
		}				
		return name;
	}	
	
//HAE KAIKKI VENEET
	public ArrayList<Vene> listaaKaikki(){
		ArrayList<Vene> veneet = new ArrayList<Vene>();
		sql = "SELECT * FROM veneet";       
		try {
			con=yhdista();
			if(con!=null){ //jos yhteys OK
				stmtPrep = con.prepareStatement(sql);        		
        		rs = stmtPrep.executeQuery();   
				if(rs!=null){ //jos kysely OK
					con.close();					
					while(rs.next()){
						Vene vene = new Vene();
						vene.setTunnus(rs.getInt(1));
						vene.setNimi(rs.getString(2));
						vene.setMerkkimalli(rs.getString(3));
						vene.setPituus(rs.getDouble(4));
						vene.setLeveys(rs.getDouble(5));	
						vene.setHinta(rs.getInt(6));
						vene.setTila(rs.getInt(7));
				//JOS VENE POISTETTU (tila 0) SITÄ EI LISTATA
						if (vene.getTila()==1) {
							veneet.add(vene);
						}
					}					
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return veneet;
	}
		
//HAE HAKUSANALLA
	public ArrayList<Vene> listaaKaikki(String hakusana){
		ArrayList<Vene> veneet = new ArrayList<Vene>();
		sql = "SELECT * FROM veneet WHERE tunnus LIKE ? or nimi LIKE ? or merkkimalli LIKE ? or pituus LIKE ? or leveys LIKE ? or hinta LIKE ?";      
		try {
			con=yhdista();
			if(con!=null){ //jos yhteys onnistui
				stmtPrep = con.prepareStatement(sql);  
				stmtPrep.setString(1, "%" + hakusana + "%");
				stmtPrep.setString(2, "%" + hakusana + "%");   
				stmtPrep.setString(3, "%" + hakusana + "%");   
				stmtPrep.setString(4, "%" + hakusana + "%");   
				stmtPrep.setString(5, "%" + hakusana + "%"); 
				stmtPrep.setString(6, "%" + hakusana + "%"); 
        		rs = stmtPrep.executeQuery();     
				if(rs!=null){ //jos kysely onnistui
					con.close();					
					while(rs.next()){
						Vene vene = new Vene();
						vene.setTunnus(rs.getInt(1));
						vene.setNimi(rs.getString(2));
						vene.setMerkkimalli(rs.getString(3));
						vene.setPituus(rs.getDouble(4));
						vene.setLeveys(rs.getDouble(5));	
						vene.setHinta(rs.getInt(6));
						vene.setTila(rs.getInt(7));
				//JOS VENE POISTETTU (tila 0) SITÄ EI LISTATA
						if (vene.getTila()==1) {
							veneet.add(vene);
						}
					}					
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return veneet;
	}
	
//LUO UUSI VENE
	public boolean lisaaVene(Vene lisattava){
		boolean paluuArvo=true;
		sql="INSERT INTO veneet (nimi, merkkimalli, pituus, leveys, hinta, tila) VALUES(?,?,?,?,?,?)";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setString(1, lisattava.getNimi());
			stmtPrep.setString(2, lisattava.getMerkkimalli());
			stmtPrep.setDouble(3, lisattava.getPituus());
			stmtPrep.setDouble(4, lisattava.getLeveys());
			stmtPrep.setInt(5, lisattava.getHinta());
			stmtPrep.setInt(6, lisattava.getTila());
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}
	
//VÄLIVAIHE ENNEN MUOKKAUSTA
		public Vene loytyykoVene(int tunnus){
			Vene vene = null;
			sql = "SELECT * FROM veneet WHERE tunnus=?";       
			try {
				con=yhdista();
				if(con!=null){ 
					stmtPrep = con.prepareStatement(sql); 
					stmtPrep.setInt(1, tunnus);
	        		rs = stmtPrep.executeQuery();  
	        		if(rs.isBeforeFirst()){ //jos vene löytyi
	        			rs.next();
	        			vene = new Vene(); 
	        			vene.setTunnus(rs.getInt(1));
	        			vene.setNimi(rs.getString(2));
						vene.setMerkkimalli(rs.getString(3));
						vene.setPituus(rs.getDouble(4));	
						vene.setLeveys(rs.getDouble(5));
						vene.setHinta(rs.getInt(6));
						vene.setTila(rs.getInt(7));
	        			con.close();        			
					}			
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return vene;		
		}
	
// MUUTA TIETOJA
	public boolean muutaVene(Vene muutettava){
		boolean paluuArvo=true;
		sql="UPDATE veneet SET nimi=?, merkkimalli=?, pituus=?, leveys=?, hinta=?, tila=? WHERE tunnus=?";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setString(1, muutettava.getNimi());
			stmtPrep.setString(2, muutettava.getMerkkimalli());
			stmtPrep.setDouble(3, muutettava.getPituus());
			stmtPrep.setDouble(4, muutettava.getLeveys());
			stmtPrep.setInt(5, muutettava.getHinta());
			stmtPrep.setInt(6, muutettava.getTila());
			stmtPrep.setInt(7, muutettava.getTunnus());
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}

// POISTA / VAIHDA TILA
	public boolean poistaVene(int tunnus){
		boolean paluuArvo=true;
		sql="UPDATE veneet SET tila=? WHERE tunnus=?";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setInt(1, 0);
			stmtPrep.setInt(2, tunnus);
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}
}