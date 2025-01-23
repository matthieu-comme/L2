public class Dalton extends Personnage {
    protected int taille;
    protected String parole;
    protected Cheval ch;

    Dalton(String n, int t, String p, Position po, Position d, int v) {
        super(n, po, d, v);
        taille = t;
        parole = p;
        ch = null;
    }

    public int getTaille() {
        return taille;
    }

    public String parle() {
        return parole;
    }

    public Cheval getCheval() {
        return ch;
    }

    public void monte(Cheval c) {
        if (ch != null)
            System.out.println(name + " est deja sur " + ch.getName());
        else if (c.getCavalier() != null) {
            System.out.println(ch.getName() + " est deja chevauche par " + ch.getCavalier().getName());
        } else {
            ch = c;
            c.setCavalier(this);
            pos.setXY(ch.pos.getX(), ch.pos.getX());
            System.out.println(this.name + " monte sur " + this.ch.name);
        }
    }

    public void descend() {
        if (ch == null)
            System.out.println(name + " n'est pas sur un cheval");
        else {
            System.out.println(this.name + " descend de " + this.ch.name);
            this.getCheval().setCavalier(null);
            ch = null;
        }
    }

    @Override
    public void setDir(int x, int y) {
        this.dir.setXY(x, y);
        if (ch != null)
            ch.dir.setXY(x, y);
        System.out.println(name + " se tourne vers " + dir);
    }

    public void move(int t) { // t = temps de deplacement
        int dx = dir.getX();
        int dy = dir.getY();
        int vitesse;
        if (ch != null)
            vitesse = ch.getVitesse();
        else
            vitesse = getVitesse();
        pos.x += (dx * vitesse * t) / Math.sqrt(dx * dx + dy * dy);
        pos.y += (dy * vitesse * t) / Math.sqrt(dx * dx + dy * dy);
        if (ch != null) {
            ch.setPos(pos.x, pos.y);
        }
        System.out.println(name + " est maintenant en " + pos);
    }

    @Override
    public String toString() {
        if (ch == null)
            return "Dalton [name=" + name + ", taille=" + taille + ", cheval=non" + ", parole=" + parole + ", pos="
                    + pos
                    + ", dir=" + dir
                    + ", vitesse=" + vitesse + "]";
        else
            return "Dalton [name=" + name + ", taille=" + taille + ", cheval=" + ch.name + ", parole=" + parole
                    + ", pos="
                    + pos
                    + ", dir=" + dir
                    + ", vitesse_cheval=" + ch.vitesse + "]";
    }

}
