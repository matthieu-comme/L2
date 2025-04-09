public class Tableau {
	int[] tab;
	Sequence sMax;

	Tableau(int n, int a) { // tableau random de n entiers compris dans [-a;a]
		this.sMax = new Sequence();
		this.tab = new int[n];
		for (int i = 0; i < n; i++)
			this.tab[i] = (int) (Math.random() * 2 * a) - a;
	}

	Tableau(boolean b) { // tableau précis
		this.sMax = new Sequence();
		if (b)
			this.tab = new int[] { 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15 }; // tableau de l'énoncé
		else
			this.tab = new int[] { -5, -1, -3, -4 };
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

		for (int i = m; i >= d; i--) { // du milieu vers la gauche
			somme += tab[i];
			if (somme > sommeGauche) {
				sommeGauche = somme;
				dMax = i;
			}
		}

		somme = 0;
		int sommeDroite = Integer.MIN_VALUE;
		int fMax = m + 1;

		for (int i = m + 1; i <= f; i++) { // du milieu vers la droite
			somme += tab[i];
			if (somme > sommeDroite) {
				sommeDroite = somme;
				fMax = i;
			}
		}
		return new Sequence(dMax, fMax, sommeGauche + sommeDroite);
	}

	public void kadane() {
		int n = this.getN();
		int somme = this.tab[0];
		int d_temp = 0;

		this.sMax = new Sequence(0, 0, somme);

		for (int i = 1; i < n; i++) {
			if (somme < 0) { // on quitte la séquence actuelle et commence une nouvelle
				somme = this.tab[i];
				d_temp = i;
			} else
				somme += this.tab[i];

			if (somme > sMax.somme) {
				this.sMax = new Sequence(d_temp, i, somme);
			}
		}
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

	// essayer un tableau précis,sinon il y a la classe Random
	public static void main(String[] args) {
		Tableau t1 = new Tableau(true);
		Tableau t2 = new Tableau(t1);
		Tableau t3 = new Tableau(t1);
		Tableau t4 = new Tableau(t1);

		t1.affiche();

		t1.methode1(0, t1.getN() - 1);
		t2.methode2(0, t2.getN() - 1);
		t3.sMax = t3.methode3(0, t3.getN() - 1);
		t4.kadane();

		System.out.println("Methode 1 : " + t1.sMax);
		System.out.println("Methode 2 : " + t2.sMax);
		System.out.println("Methode 3 : " + t3.sMax);
		System.out.println("Kadane : " + t4.sMax);
	}
}
