public class Tableau {
	int[] tab;
	Sequence sMax;
	
	Tableau(int n) {
		this.sMax = new Sequence();
		switch(n) {
		
		case 1:
			this.tab = new int[]{20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15}; // tableau de l'énoncé
			break;
		case 2:
			this.tab = new int[]{1,2,3,4,5,6,7,8};
			break;
		case 3:
			this.tab = new int[]{-2, 1, -3, 4, -1, 2, 1, -5, 4};
			break;
		case 4:
			this.tab = new int[]{3, -1, -1, 4, 5, -2, 1};
			break;
		case 5:
			this.tab = new int[]{-5, -1, -3, -4};
			break;
		case 6:
			this.tab = new int[]{1, 2, 3, 4, -11, 5, 6, 7}; // S(5,7,18)
			break;
		case 7:
			this.tab = new int[]{8, -2, -3, 5, -1, 2, 6, -4, 3};
			break;
			
		default: 
			this.tab = new int[]{20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15};
			break;
		}
	}
	Tableau(boolean b) {
		this.sMax = new Sequence();
		if(b) 
			this.tab = new int[]{20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15}; // tableau de l'énoncé
		else 
			this.tab = new int[]{1,2,3,4,5,6,7,8};
		
	}
	
	Tableau(Tableau t) {
		int n = t.getN();
		this.tab = new int[n];
		this.copieTab(t, 0, n-1);
		this.sMax = new Sequence(t.sMax);
	}
	// d indice du 1er element, f indice du dernier 
	public void methode1(int d, int f) { 
		sMax = new Sequence(d, d, tab[d]);
		int somme;		
		for(int i = d; i <= f; i++) {
			for(int j = i; j <= f; j++) {
				somme = sommeTab(i, j);	
				if (somme > sMax.somme) 
					sMax = new Sequence(i, j, somme);				
			}
		}
	}
	
	public void methode2(int d, int f) {
		sMax = new Sequence(d, d, tab[d]);
		int somme;
		for(int i = d; i <= f; i++) {
			somme = 0;
			for(int j = i; j <= f; j++) {
				somme = somme + tab[j];
				if (somme > sMax.somme) 
					sMax = new Sequence(i, j, somme);					
			}
		}
	}
	
	/* chercher smax gauche, droite, milieu
	 exemple milieu : S(4,5) (penser lon impair)
	 trouver S(i,4) max et S(5,j) max
	*/

	public void methode3(int d, int f) {
		boolean pair = ((f-d+1)%2==0);
		int mid = (f - d)/2 + d;
		this.methode2(d, mid);
		Sequence sGauche = new Sequence(this.sMax);
		this.methode2(mid+1, f);
		Sequence sDroite = new Sequence(this.sMax);
		
		if(pair) 
			this.methode2(mid, mid+1);
		else
			this.methode2(mid, mid);
		Sequence sMilieu = new Sequence(this.sMax);
		
		this.methode2(d, sMilieu.d);
		Sequence sMilieuG = new Sequence(this.sMax);
		this.methode2(sMilieu.f, f);
		Sequence sMilieuD = new Sequence(this.sMax);
		
		this.methode2(sMilieuG.d, sMilieuD.f);
		Sequence sMilieuFinal = new Sequence(this.sMax);
		
		
		System.out.println("Gauche : " + sGauche);
		System.out.println("Droite : " + sDroite);
		System.out.println("Milieu : " + sMilieu);
		System.out.println("MilieuG : " + sMilieuG);
		System.out.println("MilieuD : " + sMilieuD);
		System.out.println("MilieuFinal : " + sMilieuFinal);
		if(sGauche.somme > sDroite.somme && sGauche.somme > sMilieuFinal.somme)
			this.sMax = new Sequence(sGauche);
		else {
			if(sDroite.somme > sGauche.somme && sDroite.somme > sMilieuFinal.somme)
				this.sMax = new Sequence(sDroite);
			else
				this.sMax = new Sequence(sMilieuFinal);
		}
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
		System.out.println("SMax : " + sMax );
	}

}

