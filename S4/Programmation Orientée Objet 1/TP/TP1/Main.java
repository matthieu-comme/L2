public class Main {
    static String randomString(int length) {
        char[] t = new char[length];
        for (int i = 0; i < length; i++)
            t[i] = (char) ('a' + (int) (Math.random() * 26));
        return new String(t);
    }

    public static void main(String[] args) {
        Liste lst = new Liste();
        // Liste de chaines random
        // for (int i = 0; i < 5; i++) {
        // String s = randomString(10);
        // lst.push_front(s);
        // }
        Liste p = lst;
        for (int i = 1; i <= 20; i++) {
            Liste q = new Liste();
            q.push_front(i);

            if (i % 5 == 0) {
                p.push_front(q);
                
            }
        }

    }

}
