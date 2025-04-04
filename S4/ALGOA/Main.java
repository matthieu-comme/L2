public class Main {
	public static void main(String[] args) {
		for(int k = 1; k < 8; k++) {
			System.out.println("\nTABLEAU " + k);
				
			System.out.println("METHODE 1");
			Tableau t1 = new Tableau(k);
			t1.affiche();
			t1.methode1(0, t1.getN() - 1);
			t1.sMax.affiche();
				
			System.out.println("METHODE 2");
			Tableau t2 = new Tableau(k);
			t2.affiche();
			t2.methode2(0, t2.getN() - 1);
			t2.sMax.affiche();
				
			System.out.println("METHODE 3");
			Tableau t3 = new Tableau(k);
			t3.affiche();
			t3.methode3(0, t3.getN() - 1);
			t3.sMax.affiche();	
			
			System.out.println("-----------------------------");
			System.out.println("Egalité des 3 séquences du tableau " + k +" : " + (t1.sMax.equals(t2.sMax) && t1.sMax.equals(t3.sMax)));
			System.out.println("-----------------------------");
				
			System.gc();
		}							
	}
}
