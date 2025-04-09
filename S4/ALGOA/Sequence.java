public class Sequence {
	int d, f, somme;

	public Sequence(int d, int f, int somme) {
		if (d >= 0 && f >= 0 && d <= f) {
			this.d = d;
			this.f = f;
			this.somme = somme;
		} else
			System.out.println("Erreur de paramètres...");
	}

	public Sequence(Sequence s) {
		this.d = s.d;
		this.f = s.f;
		this.somme = s.somme;
	}

	public Sequence() {
	}

	public int getD() {
		return this.d;
	}

	public int getF() {
		return this.f;
	}

	public int getSomme() {
		return this.somme;
	}

	public String toString() {
		return "d = " + d + ", f = " + f + " et somme = " + somme;
	}

	public void affiche() {
		System.out.println("\nSequence : " + this + "");
	}

	public boolean equals(Sequence s) {
		return (this.somme == s.somme);
	}
}
