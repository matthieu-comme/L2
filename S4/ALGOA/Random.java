public class Random {

	public static void main(String[] args) {

		int nb_essais = 100;
		int pui_max = 6; // taille du tableau 10^0 à 10^pui_max
		int max_methode1 = (int) Math.pow(10, 3); // dernière puissance testée par la méthode 1
		int max_methode2 = (int) Math.pow(10, 4); // pareil pour la 2
		long[][] t = new long[4][pui_max + 1]; // tableau stockant les temps d'exec : 4 méthodes, pui+1 valeurs de n
												// différentes
		int cpt_pui = 0; // colonne du tableau t

		for (int k = 1; k <= Math.pow(10, pui_max); k = k * 10) {
			int a = k; // valeurs du tableau dans [-a;a]
			for (int i = 0; i < nb_essais; i++) {
				System.out.println("Essai " + i + " de la longueur " + k);

				Tableau t1 = new Tableau(k, a);
				Tableau t2 = new Tableau(t1);
				Tableau t3 = new Tableau(t1);
				Tableau t4 = new Tableau(t1);

				long start = System.nanoTime();
				if (k <= max_methode1)
					t1.methode1(0, t1.getN() - 1);
				long end = System.nanoTime();
				long duree = end - start;
				t[0][cpt_pui] += duree;

				start = System.nanoTime();
				if (k <= max_methode2)
					t2.methode2(0, t2.getN() - 1);
				end = System.nanoTime();
				duree = end - start;
				t[1][cpt_pui] += duree;

				start = System.nanoTime();
				t3.sMax = t3.methode3(0, t3.getN() - 1);
				end = System.nanoTime();
				duree = end - start;
				t[2][cpt_pui] += duree;

				start = System.nanoTime();
				t4.kadane();
				end = System.nanoTime();
				duree = end - start;
				t[3][cpt_pui] += duree;

				// on ignore t1 et t2 passé une certaine taille de tableau
				boolean egalite = (t1.sMax.equals(t2.sMax) && t1.sMax.equals(t3.sMax) && t1.sMax.equals(t4.sMax)
						|| ((k > max_methode1) && t2.sMax.equals(t3.sMax) && t2.sMax.equals(t4.sMax))
						|| (k > max_methode2) && t3.sMax.equals(t4.sMax));

				// affiche les séquences si elles sont différentes
				if (!egalite) {
					t1.sMax.affiche();
					t2.sMax.affiche();
					t3.sMax.affiche();
					t4.sMax.affiche();
				}
				System.gc();
			}
			cpt_pui++;
		}
		for (int i = 0; i < cpt_pui; i++) {
			System.out.println("\nTaille du tableau : " + (int) Math.pow(10, i));
			for (int j = 0; j < 4; j++) {
				System.out
						.println("Temps moyen " + ((j == 3) ? "Kadane" : (j + 1)) + " : "
								+ t[j][i] / nb_essais + " nanosecondes");
			}
		}
	}
}
