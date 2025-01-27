public class Main {
    static String randomString(int length) {
        char[] t = new char[length];
        for (int i = 0; i < length; i++)
            t[i] = (char) ('a' + (int) (Math.random() * 26));
        return new String(t);
    }

    public static void main(String[] args) {

        // question 2.2
        // Liste lst = new Liste();
        // for (int i = 0; i < 5; i++)
        // lst.push_front(randomString(10));
        // lst.affiche();

        // question 2.3
        // Liste megaliste = new Liste();
        // Liste p = new Liste("Liste 1", null);
        // Liste q = new Liste("Liste 10", null);
        // Liste r = new Liste("Liste 100", null);

        // int np = 1;
        // int nq = 10;
        // int nr = 100;

        // for (int i = 0; i < 10; i++) {
        // np++;
        // nq++;
        // nr++;
        // p.push_back(np);
        // q.push_back(nq);
        // r.push_back(nr);
        // }
        // megaliste.push_front(r);
        // megaliste.push_front(q);
        // megaliste.push_front(p);
        // megaliste.affiche();

        Crypteur test = new Crypteur(3);

    }
}
