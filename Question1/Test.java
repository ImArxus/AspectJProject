/****************
 * Monitoring d'appels de méthodes: exemple de la pile
 * 
 * Cours: 8INF958
 * 
 * Auteur: Klaus Havelund
 ****************/

class Test {
	
	public static void main1() {
		StackInterface stack = new Stack();
		for (int i = 0; i < 3; i++) {
			stack.pop();
		}
	}
	
	public static void main2() {
		StackInterface stack = new Stack();
		for (int i = 0; i < 1001; i++) {
			stack.push(i);
		}
		
		for (int i = 0; i < 1001; i++) {
			stack.pop(); 
			// Ici il y a un probleme que nous allons reperer dans le cas 3 (override de 
			// l'objet a l'indice stacksize -1
		}

	}
	
	public static void main3() {
		StackInterface stack = new Stack();

		for (int i = 0; i < 1001; i++) {
			stack.push(i);
		}
		for (int i = 0; i < 1001; i++) {
			stack.pop();
		}

	}


	
		
	public static void main(String[] args) {
		
		main1();
		main2();
		main3();
	}
	
	
}
