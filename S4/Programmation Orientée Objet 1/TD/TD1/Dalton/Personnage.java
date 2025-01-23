public abstract class Personnage {
    protected String name;
    protected Position pos, dir;
    protected int vitesse;

    Personnage(String n, Position po, Position d, int v) {
        name = n;
        pos = new Position(po);
        vitesse = v;
        dir = new Position(d);
    }

    public String getName() {
        return name;
    }

    public Position getPos() {
        return pos;
    }

    public void setPos(int x, int y) {
        this.pos.setXY(x, y);
    }

    public Position getDir() {
        return dir;
    }

    public void setDir(int x, int y) {
        this.dir.setXY(x, y);
        System.out.println(name + " se tourne vers " + dir);
    }

    public int getVitesse() {
        return vitesse;
    }

    public void setVitesse(int vitesse) {
        this.vitesse = vitesse;
    }

    public void affiche() {
        System.out.println(this);
    }
}
