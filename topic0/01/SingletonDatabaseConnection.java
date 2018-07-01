package SingletonExample;

public class SingletonDatabaseConnection {

	private static SingletonDatabaseConnection singletonDatabaseConnection = null;
	
	private String url;
	private String username;
	private String password;
	private String database;
	
	private SingletonDatabaseConnection() {
		this.url= "localhost";
		this.username= "root";
		this.password= "root";
		this.database= "dBName";
	}
	
	public static SingletonDatabaseConnection getInstance() {
		if (singletonDatabaseConnection == null) {
			singletonDatabaseConnection = new SingletonDatabaseConnection();
		}
		return singletonDatabaseConnection;
	}
	
}
