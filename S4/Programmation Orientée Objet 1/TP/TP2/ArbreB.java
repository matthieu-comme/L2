import java.util.ArrayList;

public class ArbreB implements IArbre { // doit etre abstract et redefinir que depth !
	protected int valeur;
	protected ArbreB g;
	protected ArbreB d;
	
	ArbreB(int x) {
		this.valeur = x;
		g = null;
		d = null;		
	}
	ArbreB(int x, ArbreB g, ArbreB d) {
		this.valeur = x;
		this.g = g;
		this.d = d;		
	}
		
	public void addNode(int x) { // terminer 
		if(g == null && d == null) g = new ArbreB(x);
		else if(d == null) d = new ArbreB(x);
		else if(g.g != null && g.d !=null)g.addNode(x);
	}
	public void removeNode(int x) {
		
	}
	public int depth() {
		if(g == null && d == null) return 0;
		else if (g == null) return 1 + d.depth();
		else if (d == null) return 1 + g.depth();
		else return 1 + Math.max(g.depth(),d.depth());
	}
	public boolean isNode(int x) {
		return true;
	}
	
	public static void main(String[] args) {
	
		//ArbreB a = new ArbreB(50, new ArbreB(10,null,new ArbreB(44,null,null)), null);
		ArbreB a = new ArbreB(50);
		System.out.println("Hauteur racine : "+a.depth());
		for(int i = 1; i < 15; i++) {
			a.addNode(10);
			int cpt = i+1;
			System.out.println("nb de noeuds = "+cpt+" et hauteur = "+a.depth());
		
		}	
	
	}
}
