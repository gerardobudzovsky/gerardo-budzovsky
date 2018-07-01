package SingletonExample;

public class SingletonDemo {
	
	public static void main(String[] args) {
		SingletonDatabaseConnection singletonDatabaseConnection = SingletonDatabaseConnection.getInstance();

		System.out.println(singletonDatabaseConnection);
	}

}
