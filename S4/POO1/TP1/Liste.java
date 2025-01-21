public class Liste {
	protected Object value;
	protected Liste queue;
	public Liste() {
		value = null;
		queue = null;
	}
	public Liste(Object o, Liste l) {
		value = o;
		queue = l;
	}
	public boolean isEmpty() {
		return (value == null && queue == null);
	}
	public Object head() { return value; }
	public Liste tail() { return queue;	}
	public void push_front(Object o) {
		Liste p = new Liste();
		p.queue = this.queue;
		this.queue = p;
		p.value = this.value;
		this.value = o;		
	}
	public void push_back(Object o) {
		if (this.value == null) 
		{ 
			this.value = o; 
		}
		else {
			Liste p = this;
			while (p.queue != null) {
				p = p.tail();			
			}
			Liste temp = new Liste();
			temp.value = o;
			p.queue = temp;		
		}
	}
	
	public void affiche() {
		Liste p = this;
		String s = "<";
		while (p.tail().head() != null) {
			s = s+(p.head())+",";
			p = p.tail();			
		}
		
		s = s+p.head();
		s = s + ">";
		System.out.println(s);
	}
	
	public int getPosition(Object o) {
		int i = -1; int cpt = 1;
		Liste p = this;
		while (p.value !=null && i == -1) {
			if (p.value == o) i = cpt;
			p = p.tail();
			cpt++;
		}
		if(i==-1) System.out.println("Objet "+o+" non trouvé...");
		else System.out.println("Objet "+o+" trouvé à l'indice "+i);
		return i;
	}
	
	public Object getObject(int i) { // REVOIR LES CONDITIONS D ARRET
		Liste p = this;
		while (p.value != null || i != 1) {
			p = p.tail();
			i--;			
		}
		if (cpt != i) {
			System.out.println("L'indice donné est supérieur à la taille de la liste...");
			return null;
		}
		else {
			System.out.println("L'objet à l'indice "+i+" est "+p.head());
			return p.head();
		}
			
			
	}
	
	public static void main(String[] args) {
		Liste lst = new Liste();
		/*		
		lst.push_back(20);
		//lst.affiche();		
		lst.push_back(15);
		//lst.affiche();
		lst.push_back(10);
		//lst.affiche();
		lst.push_back(5);
		//lst.affiche();
		lst.push_back(0);
		lst.affiche();
		lst = lst.tail();
		lst.affiche();
		*/		
		
		
		lst.push_front(20);
		//lst.affiche();		
		lst.push_front(15.5);
		//lst.affiche();
		lst.push_front("Bonjour");
		//lst.affiche();
		lst.push_front(5);
		//lst.affiche();
		lst.push_front(0);
		lst.affiche();
		/*
		lst.getPosition(5);
		lst.getPosition(20);
		lst.getPosition(69);
		*/
		lst.getObject(1);
		lst.getObject(2);
		lst.getObject(4);
		lst.getObject(6);
		lst.getObject(8);
		
	
		
		
	}
	
}
