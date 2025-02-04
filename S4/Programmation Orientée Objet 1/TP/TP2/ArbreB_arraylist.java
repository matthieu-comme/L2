import java.util.ArrayList;

public class ArbreB implements IArbre {
	protected int valeur;
	ArrayList<ArbreB> fils;
	
	ArbreB(int x) {
		this.valeur = x;
		fils = new ArrayList<ArbreB>();
		fils.add(null);
		fils.add(null);		
	}
	ArbreB(int x, ArbreB g, ArbreB d) {
		this.valeur = x;
		fils = new ArrayList<ArbreB>();
		fils.add(g);
		fils.add(d);		
	}
		
	public void addNode(int x) {
		if(fils.get(0) == null || fils.get(1) == null) {
			fils.add(new ArbreB(x));
		} else fils.get(0).addNode(x);
	}
	public void removeNode(int x) {
		
	}
	public int depth() {
		if(fils.get(0) == null && fils.get(1)==null) return 0;
		else if (fils.get(0) == null) return 1 + fils.get(1).depth();
		else if (fils.get(1) == null) return 1 + fils.get(0).depth();
		else return 1 + Math.max(fils.get(0).depth(),fils.get(1).depth());
	}
	public boolean isNode(int x) {
		return true;
	}
	
	public static void main(String[] args) {
	
	// ArbreB a = new ArbreB(50, new ArbreB(10,null,new ArbreB(44,null,null)), null);
	//ArbreB a = new ArbreB(50);
	System.out.println("Hauteur : "+a.depth());
	a.addNode(10);
	System.out.println("Hauteur : "+a.depth());
	a.addNode(10);
	System.out.println("Hauteur : "+a.depth());
	a.addNode(10);
	System.out.println("Hauteur : "+a.depth());
	a.addNode(10);
	System.out.println("Hauteur : "+a.depth());
	a.addNode(10);
	
	
	}
}
