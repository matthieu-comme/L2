import javax.swing.JFrame;
import java.awt.Graphics;
import java.awt.Color;
import java.util.ArrayList;

public class CrowdGame {

	CrowdFrame frame;
	int w, h; // largeur et hauteur de la simulation
	static Personne[] tabPersonnes;

	public CrowdGame(int w, int h, int nbOfMobiles) {
		this.w = w;
		this.h = h;
		// ... A COMPLETER
		this.frame = new CrowdFrame(w, h, this);
	}

	Displayable[] getDisplayables() {
		return tabPersonnes;// ... A COMPLETER
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

			this.frame.repaint();
		}
	}

	public static void main(String[] toto) {
		CrowdGame cg = new CrowdGame(1000, 800, 50);
		tabPersonnes[0] = new Travailleur(200, 200, null);
		tabPersonnes[1] = new Touriste(600, 600, Color.RED);
		cg.run();
	}
}
