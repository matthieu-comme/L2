public class Crypteur {
    Liste alphabet;
    Liste alphabet_decale;
    int decalage;

    Crypteur(int d) {
        decalage = d;
        alphabet = new Liste();
        alphabet_decale = new Liste();

        for (char c = 'a'; c <= 'z'; c++) {
            alphabet.affiche();
            alphabet_decale.affiche();
            alphabet.push_back(c);
            char c_d = (char) (c + d);
            if (c_d > 'z')
                c_d -= 26;
            alphabet_decale.push_back(c_d);
        }
        alphabet.affiche();
        alphabet_decale.affiche();
    }
}
