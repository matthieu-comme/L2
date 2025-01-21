public class Liste {
    protected Object valeur;
    protected Liste queue;

    public Liste() {
        valeur = null;
        queue = null;
    }

    public Liste(Object o, Liste l) {
        valeur = o;
        queue = l;
    }

    public boolean estVide() {
        return (valeur == null && queue == null);
    }

    public Object tete() {
        return valeur;
    }

    public Liste queue() {
        return queue;
    }

    public void push_front(Object o) {
        if (this.valeur == null) {
            this.valeur = o;
        } else {
            Liste p = new Liste();
            p.queue = this.queue;
            this.queue = p;
            p.valeur = this.valeur;
            this.valeur = o;
        }
        System.out.println(o + " est insere en tete : " + toString());
    }

    public void push_back(Object o) {
        if (this.valeur == null) {
            this.valeur = o;
        } else {
            Liste p = this;
            while (p.queue != null) {
                p = p.queue;
            }
            p.queue = new Liste();
            p.queue.valeur = o;
        }
        System.out.println(o + " est insere en dernier element : " + toString());
    }

    public String toString() {
        Liste p = this;
        String s = "<";
        while (p.queue != null) {
            s = s + (p.valeur) + ", ";
            p = p.queue;
        }
        s = s + p.valeur;
        s = s + ">";
        return s;
    }

    public int getPosition(Object o) { // retourne la position de la premiere iteration de o, -1 si absent de la liste
        int i = 1;
        Liste p = this;
        while (p != null && p.valeur != null) {
            if (p.valeur == o) {
                System.out.println("Objet " + o + " trouve a l'indice " + i);
                return i;
            }
            p = p.queue();
            i++;
        }
        System.out.println("Objet " + o + " non trouve...");
        return -1;
    }

    public Object getObject(int i) { // retourne l'objet qui est en ieme position, null sinon
        int cpt = 1;
        if (i < 1) {
            System.out.println("L'indice doit etre superieur a 0");
            return null;
        }
        System.out.print("On cherche l'objet qui se trouve a l'indice " + i + " : ");
        Liste p = this;
        while (p != null) {
            if (cpt == i) {
                System.out.println("cet objet vaut " + p.tete());
                return p.tete();
            }
            p = p.queue();
            cpt++;
        }
        System.out.println("l'indice donne est superieur a la taille de la liste...");
        return null;

    }

    public int longueur() {
        int cpt = 0;
        Liste p = this;
        while (p != null) {
            cpt++;
            p = p.queue();
        }
        System.out.println("La longueur de la liste est " + cpt);
        return cpt;

    }

    public static void main(String[] args) {
        Liste lst = new Liste();

        lst.push_back(20);
        lst.push_back(15);
        lst.push_back(10);
        lst.push_back(5);
        lst.push_back(0);

        lst.push_front(20);
        lst.push_front(15.5);
        lst.push_front("Bonjour");
        lst.push_front(5);
        lst.push_front(0);

        lst.getPosition(20);
        lst.getPosition(69);

        lst.getObject(0);
        lst.getObject(2);
        lst.getObject(6);
        lst.longueur();
        lst.getObject(11);

    }
}
