public class Tableau {
	int[] tab;
	int max;
	Sequence sMax;
	
	Tableau(int n) {
		if(n>0) {
			this.tab = new int[n];
			this.sMax = new Sequence();
		}
		else
			System.out.println("n doit être >0");
	}
	Tableau(boolean b) {
		this.tab = new int[]{20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15};
		this.sMax = new Sequence();
	}
	
	// d indice du 1er element, f indice du dernier 
	public void methode1(int d, int f) { 
		max = tab[d];
		sMax = new Sequence(d, d);
		int somme;		
		for(int i = d; i <= f; i++) {
			for(int j = i; j <= f; j++) {
				somme = sommeTab(i, j);	
				if (somme > max) {
					max = somme;
					sMax = new Sequence(i, j);				
				}
			}
		}
	}
	
	public void methode2(int d, int f) {
		max = tab[d];
		sMax = new Sequence(d, d);
		int somme;
		for(int i = d; i <= f; i++) {
			somme = 0;
			for(int j = i; j <= f; j++) {
				somme = somme + tab[j];
				if (somme > max) {
					max = somme;
					sMax = new Sequence(i, j);				
				}
			}
		}
	}
	
	/* chercher smax gauche, droite, milieu
	 milieu : S(4,5) = 38 (penser lon impair)
	 trouver S(i,4) max et S(5,j) max
	*/
	public void methode3(int d, int f) {
		int n = f - d + 1;
		int milieu = n/2;
		if(n % 2 == 0) {
			Tableau gauche = new Tableau(milieu);
			gauche.copieTab(this, d, f);
		}
		else {
			Tableau gauche = new Tableau(milieu+1);
		}
		Tableau droite = new Tableau(milieu);
		
	}

	public int sommeTab(int d, int f) { // O(f-d+1) = O(n) pour f-d maximal
		int somme = 0;
		for(int i = d; i <= f; i++) 
			somme += this.tab[i];
		return somme;
	}
	
	public void copieTab(Tableau t, int d, int f) { // ce tableau devient une copie de de t[d, ..., f],
		int j = 0;
		for(int i = d; i <= f; i++) {
			this.tab[j] = t.tab[i];
			j++;
		}
	}
	public String toString() {
		String s = "T = [";
		int n = this.getN();
		for(int i = 0; i < n - 1; i++)
			s = s + tab[i] + ", ";
		s = s + tab[n-1] + "]";
		return s;
	}
	
	public int getN() { return this.tab.length; }
	public void affiche() { 
		
		System.out.println(this + "; Longueur = " + getN());
		System.out.println("SMax = " + sMax);
		System.out.println("Somme max = " + max);
	}
	public static void main(String[] args) {
		Tableau t1 = new Tableau(true);
		int n1 = t1.getN();
		t1.methode1(0, n1 - 1);
		t1.affiche();
		Tableau t2 = new Tableau(3);
		/*
		int n2 = t2.getN();
		t2.affiche();
		t2.methode2(0, n2 - 1);
		t2.copieTab(t1, 8, 10);
		t2.affiche();
		t1.tab[0] = 1000;
		t1.affiche(); t2.affiche();
		*/
		t2.methode3();
	}
}

