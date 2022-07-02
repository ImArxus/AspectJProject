/****************
 * Monitoring d'appels de méthodes: exemple de la pile
 * 
 * Cours: 8INF958
 * 
 * Auteur: Klaus Havelund
 ****************/

public class SimpleDemo {
	public static void main(String[] args) {
		Bank b = new Bank();

		// Propriété #1
//		 b.isApproved(123, 2000);
//		 b.withdraw(456, 2000);

		// Propriété #2
//		b.open(123);
//		b.withdraw(123, 200);
//		b.open(124);
//		b.close(123);
//		b.close(124);

		// Propriété #3
		b.open(123);
		b.isApproved(123, 2000);
		b.withdraw(123, 2000);
		b.close(123);

	}
}
