import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.util.ArrayList;

public class CrowdGame {

	CrowdFrame frame;
	int w, h; // largeur et hauteur de la simulation
	static Displayable[] tabPersonne;

	public CrowdGame(int w, int h, int nbOfMobiles) {
		this.w = w;
		this.h = h; 
		this.frame = new CrowdFrame(w, h, this);
		tabPersonne = new Displayable[nbOfMobiles];
		for(int i = 0; i < nbOfMobiles; i = i+2) {
			tabPersonne[i] = new Travailleur((int)(Math.random()*1000), (int)(Math.random()*800));
			tabPersonne[i+1] = new Touriste((int)(Math.random()*1000), (int)(Math.random()*800), generateColor(nbOfMobiles,i));
		}
	}

	Displayable[] getDisplayables() {	
		return tabPersonne;
	}

	// genere la ieme couleur parmi nb, de maniere a ce que les nb couleurs soient
	// reparties sur la gamme chromatique
	// i doit etre dans [0,nb-1]
	public static java.awt.Color generateColor(int nb, int i) {
		float shift = ((float) nb) / 3;
		return new java.awt.Color((int) ((Math.sin(i * Math.PI * 2 / nb) + 1) * 127),
				(int) ((Math.sin((i + shift) * Math.PI * 2 / nb) + 1) * 127),
				(int) ((Math.sin((i + 2 * shift) * Math.PI * 2 / nb) + 1) * 127));
	}

	public void run() {
		while (true) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
			// ... A COMPLETER
			getDisplayables();
			this.frame.repaint(); // repaint
		}
	}

	public static void main(String[] toto) {
		CrowdGame cg = new CrowdGame(1000, 800, 1000);		
		cg.run();
	}
}
