class Personne{
	String nom;
	int age;
	Personne(String nom, int age){
		this.nom = nom;
		this.age = age;
	}
	String getNom(){ return this.nom; }
	int getAge(){ return this.age; }
	void setAge(int a){ this.age = a; }
	void anniversaire() { age++; }
	
	public String toString() {
		return "Je m'appelle "+nom+" et j'ai "+age+" ans !\n";}

	public static void main(String[] s) {
		Personne p = new Personne("Toto",5);
		Personne q = new Personne("Titi", 86);
		System.out.println(p.toString()+q.toString());
		p.anniversaire();
		q.anniversaire();
		System.out.println(p.toString()+q.toString());		
	}
}
