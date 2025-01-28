public class Crypteur {
    Liste alphabet;
    Liste alphabet_decale;
    int decalage;

    Crypteur(int d) {
        decalage = d;
        alphabet = new Liste();
        alphabet_decale = new Liste();

        for (char c = 'a'; c <= 'z'; c++) {
            alphabet.push_back(c);
            char c_d = (char) (c + d);
            if (c_d > 'z')
                c_d -= 26;
            alphabet_decale.push_back(c_d);
        }
        alphabet.affiche();
        alphabet_decale.affiche();
        
    }
    public char correspondance(char c, Liste a, Liste d) {
    		if( !(c>='a' && c<='z')) {
	    		return c;
	    	}
		Liste p = a;
	    	Liste q = d;
	    	while(p != null) { // liste vide securite    			    		
	    		if((char)p.getValeur() == c) {
	    			return (char)q.getValeur();
	    		}
	    		p = p.queue;
	    		q = q.queue;	
	    	}
	    	return '*';
    }
    
    public String cryptage(String s) {
    	String res = "";
    	char[] tab = s.toCharArray();
	int lon = tab.length;
	for(int i = 0; i < lon; i++) {
		res = res +correspondance(tab[i], alphabet, alphabet_decale);
	}
    	return res;	
    }
    public String decryptage(String s) {
    String res = "";
    	char[] tab = s.toCharArray();
	int lon = tab.length;
	for(int i = 0; i < lon; i++) {
		res = res +correspondance(tab[i], alphabet_decale, alphabet);
	}
    	return res;
    
    }
    public static void main(String[] args) {
    	Crypteur test = new Crypteur(3);
    	String mot1 = "bonjour ca va ?!"; // = 'erqmrxu fd yd ?!'
    	System.out.println("Mot : "+mot1+" ; Mot crypte : "+test.cryptage(mot1));
    	System.out.println("Mot : "+test.cryptage(mot1)+" ; Mot crypte : "+test.decryptage(test.cryptage(mot1)));
    }
}
