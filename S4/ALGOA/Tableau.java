public class Tableau {
	int[] tab;
	Sequence sMax;

	Tableau(int n) {
		this.sMax = new Sequence();
		switch (n) {

			case 1:
				this.tab = new int[] { 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15 }; // tableau de l'énoncé
				break;
			case 2:
				this.tab = new int[] { 1, 2, 3, 4, 5, 6, 7, 8 };
				break;
			case 3:
				this.tab = new int[] { -2, 1, -3, 4, -1, 2, 1, -5, 4 };
				break;
			case 4:
				this.tab = new int[] { 3, -1, -1, 4, 5, -2, 1 };
				break;
			case 5:
				this.tab = new int[] { -5, -1, -3, -4 };
				break;
			case 6:
				this.tab = new int[] { 1, 2, 3, 4, -11, 5, 6, 7 }; // S(5,7,18)
				break;
			case 7:
				this.tab = new int[] { 8, -2, -3, 5, -1, 2, 6, -4, 3 };
				break;

			default:
				this.tab = new int[] { 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15 };
				break;
		}
	}

	Tableau(boolean b) {
		this.sMax = new Sequence();
		if (b)
			this.tab = new int[] { 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15 }; // tableau de l'énoncé
		else
			this.tab = new int[] { 1, 2, 3, 4, 5, 6, 7, 8 };

	}

	Tableau(Tableau t) {
		int n = t.getN();
		this.tab = new int[n];
		this.copieTab(t, 0, n - 1);
		this.sMax = new Sequence(t.sMax);
	}

	// d indice du 1er element, f indice du dernier
	public void methode1(int d, int f) {
		sMax = new Sequence(d, d, tab[d]);
		int somme;
		for (int i = d; i <= f; i++) {
			for (int j = i; j <= f; j++) {
				somme = sommeTab(i, j);
				if (somme > sMax.somme)
					sMax = new Sequence(i, j, somme);
			}
		}
	}

	public void methode2(int d, int f) {
		sMax = new Sequence(d, d, tab[d]);
		int somme;
		for (int i = d; i <= f; i++) {
			somme = 0;
			for (int j = i; j <= f; j++) {
				somme = somme + tab[j];
				if (somme > sMax.somme)
					sMax = new Sequence(i, j, somme);
			}
		}
	}

	public Sequence methode3(int d, int f) {
		if (d == f) // condition d'arrêt : sous-tableau d'un élément
			return new Sequence(d, d, tab[d]);

		int m = (d + f) / 2;

		Sequence gauche = methode3(d, m);
		Sequence droite = methode3(m + 1, f);
		Sequence milieu = maxMilieu(d, m, f);

		if (gauche.somme >= droite.somme && gauche.somme >= milieu.somme)
			return gauche;
		else {
			if (droite.somme >= milieu.somme)
				return droite;
			else
				return milieu;
		}
	}

	public Sequence maxMilieu(int d, int m, int f) {
		int somme = 0;
		int sommeGauche = Integer.MIN_VALUE;
		int dMax = m;

		// du milieu vers la gauche
		for (int i = m; i >= d; i--) {
			somme += tab[i];
			if (somme > sommeGauche) {
				sommeGauche = somme;
				dMax = i;
			}
		}

		somme = 0;
		int sommeDroite = Integer.MIN_VALUE;
		int fMax = m + 1;

		// du milieu vers la droite
		for (int i = m + 1; i <= f; i++) {
			somme += tab[i];
			if (somme > sommeDroite) {
				sommeDroite = somme;
				fMax = i;
			}
		}
		return new Sequence(dMax, fMax, sommeGauche + sommeDroite);
	}

	public int sommeTab(int d, int f) { // O(f-d+1) = O(n) pour f-d maximal
		int somme = 0;
		for (int i = d; i <= f; i++)
			somme += this.tab[i];
		return somme;
	}

	public void copieTab(Tableau t, int d, int f) { // ce tableau devient une copie de de t[d, ..., f],
		int j = 0;
		for (int i = d; i <= f; i++) {
			this.tab[j] = t.tab[i];
			j++;
		}
	}

	public String toString() {
		String s = "T = [";
		int n = this.getN();
		for (int i = 0; i < n - 1; i++)
			s = s + tab[i] + ", ";
		s = s + tab[n - 1] + "]";
		return s;
	}

	public int getN() {
		return this.tab.length;
	}

	public void affiche() {
		System.out.println(this + "; Longueur = " + getN());
		System.out.println("SMax : " + sMax);
	}

}
