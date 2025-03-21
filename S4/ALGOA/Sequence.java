public class Sequence {
	int d, f;
	public Sequence(int d, int f) {
		if(d>=0 && f>=0 && d <= f) {
			this.d = d;
			this.f = f;
		}
		else System.out.println("Erreur de paramètres...");
	}
	public Sequence(Sequence s) {
		this.d = s.d;
		this.f = s.f;
	}
	public Sequence() {}	
	public int getD() { return this.d; };
	public int getF() { return this.f; };
	public String toString() {
		return "d = " + d + " et f = " + f;
	}
}
