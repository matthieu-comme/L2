public class Liste {
    protected Object valeur;
    protected Liste queue;

    public Liste() {
        valeur = null;
        queue = null;
    }

    public Liste(Object v, Liste q) {
        valeur = v;
        queue = q;
    }

    public boolean estVide() {
        return (valeur == null && queue == null);
    }

    public Object getValeur() {
        return valeur;
    }

    public Liste getQueue() {
        return queue;
    }

    public void push_front(Object o) {
        if (valeur == null) {
            valeur = o;

        } else {
            Liste p = new Liste(this.valeur, this.queue);
            this.queue = p;
            this.valeur = o;
        }
        System.out.println(o + " est insere en tete !");
    }

    public void push_back(Object o) {
        if (valeur == null) {
            this.valeur = o;
        } else {
            Liste p = this;
            while (p.queue != null) {
                p = p.getQueue();
            }
            p.queue = new Liste(o, null);
        }
        // System.out.println(o + " est insere au cul !");
    }

    public int getIndex(Object o) {
        int cpt = 1;
        Liste p = this;
        while (p != null) {
            if (p.valeur.equals(o)) {
                System.out.println(o + " est trouve en position " + cpt);
                return cpt;
            }
            p = p.queue;
            cpt++;
        }
        System.out.println(o + " n est pas dans la liste...");
        return -1;
    }

    public Object getObject(int i) {
        if (i < 1) {
            System.out.println("Indice incorrect, doit etre strict positif");
            return null;
        }
        if (i == 1) {
            System.out.println("L'objet est " + this.valeur);
            return this.valeur;
        }
        if (this.queue == null) {
            System.out.println("Aucun objet ne se trouve a cet indice...");
            return null;
        }
        return queue.getObject(i - 1);
    }

    @Override
    public String toString() {
        if (estVide())
            return "< >";
        String s = "<";
        Liste p = this;
        while (p.queue != null && p.valeur != null) {
            s = s + p.getValeur() + ", ";
            p = p.getQueue();
        }
        s = s + p.getValeur() + ">";
        return s;
    }

    public void affiche() {
        System.out.println(this);
    }
}
