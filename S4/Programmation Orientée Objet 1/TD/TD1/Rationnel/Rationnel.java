package Rationnel;

public class Rationnel {
    int num;
    int den;

    Rationnel() {
        num = 0;
        den = 1;
    }

    Rationnel(int i) {
        num = i;
        den = 1;
    }

    Rationnel(int n, int d) {
        num = n;
        den = d;
    }

    Rationnel(Rationnel x) {
        num = x.num;
        den = x.den;
    }

    void setNum(int n) {
        this.num = n;
    }

    void setDen(int d) {
        this.den = d;
    }

    void afficheFrac() {
        System.out.println(this.num + "/" + this.den);
    }

    void afficheDec() {
        System.out.println(((float) this.num) / this.den);
    }

    public String toString() {
        return "Numerateur = " + this.num + " et Denominateur = " + this.den + " -> Valeur = "
                + (((float) this.num) / this.den);
    }

    Rationnel plus(Rationnel x) {
        return new Rationnel(this.num * x.den + x.num * this.den, this.den * x.den);
    }

    Rationnel mult(Rationnel x) {
        return new Rationnel(this.num * x.num, this.den * x.den);
    }

    Rationnel mult(int i) {
        return new Rationnel(this.num * i, this.den);
    }

    public static void main(String[] s) {
        Rationnel a = new Rationnel(3, 4);
        Rationnel b = new Rationnel(7);
        Rationnel c = a.mult(10);
        /*
         * a.afficheDec();
         * a.afficheFrac();
         * b.afficheDec();
         * b.afficheFrac();
         * c.afficheDec();
         * c.afficheFrac();
         */
        System.out.println(a.toString());
        System.out.println(b.toString());
        System.out.println(c.toString());
    }

}