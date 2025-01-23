import java.awt.Color;

public class Cheval extends Personnage {
    protected Color couleur;
    protected Dalton cavalier;

    public Cheval(String n, Color color, Position po, Position d, int v) {
        super(n, po, d, v);
        this.cavalier = null;
        couleur = color;
    }

    public Color getCouleur() {
        return couleur;
    }

    public Dalton getCavalier() {
        return cavalier;
    }

    public void setCavalier(Dalton cavalier) {
        this.cavalier = cavalier;
    }

    public void move(int t) { // t = temps de deplacement
        int dx = dir.getX();
        int dy = dir.getY();
        int vitesse;
        vitesse = getVitesse();
        pos.x += (dx * vitesse * t) / Math.sqrt(dx * dx + dy * dy);
        pos.y += (dy * vitesse * t) / Math.sqrt(dx * dx + dy * dy);
        System.out.println(name + " est maintenant en " + pos);
    }

    @Override
    public String toString() {
        if (cavalier == null)
            return "Cheval [name=" + name + ", couleur=" + couleur + ", cavalier=non" + ", pos=" + pos
                    + ", dir="
                    + dir + ", vitesse="
                    + vitesse + "]";
        else
            return "Cheval [name=" + name + ", couleur=" + couleur + ", cavalier=" + cavalier.name + ", pos=" + pos
                    + ", dir="
                    + dir + ", vitesse="
                    + vitesse + "]";
    }

}
