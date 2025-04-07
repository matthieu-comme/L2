public class Main {
	public static void main(String[] args) {
		for (int k = 1; k < 8; k++) {
			System.out.println("\nTABLEAU " + k);

			// System.out.println("METHODE 1");
			Tableau t1 = new Tableau(k);
			t1.affiche();
			t1.methode1(0, t1.getN() - 1);

			// System.out.println("METHODE 2");
			Tableau t2 = new Tableau(k);
			// t2.affiche();
			t2.methode2(0, t2.getN() - 1);

			// System.out.println("METHODE 3");
			Tableau t3 = new Tableau(k);
			// t3.affiche();
			t3.sMax = t3.methode3(0, t3.getN() - 1);
			t1.sMax.affiche();

			boolean egalite = (t1.sMax.equals(t2.sMax) && t1.sMax.equals(t3.sMax));
			if (!egalite) {
				t2.sMax.affiche();
				t3.sMax.affiche();
			}
			System.out.println("----------------------------------------");
			System.out.println("Egalité des 3 séquences du tableau " + k + " : " + egalite);
			System.out.println("----------------------------------------");

			System.gc();
		}
	}
}
