import java.awt.Color;

public class Main {
    public static void main(String[] args) {
        Position spawn = new Position(0, 0);
        Dalton joe = new Dalton("Joe", 137, "Je hais Lucky Luke", spawn, spawn, 6);
        // Dalton jack = new Dalton("Jack", 165, "Calme toi Joe", spawn, 5);
        // Dalton william = new Dalton("Joe", 190, "Je hais Lucky Luke", spawn, 4);
        // Dalton averell = new Dalton("Joe", 210, "Quand est-ce qu'on mange ?", spawn,
        // 3);
        Cheval bogoss = new Cheval("Bogoss", Color.PINK, spawn, spawn, 20);
        joe.affiche();
        bogoss.affiche();
        joe.descend();
        joe.monte(bogoss);
        joe.setDir(50, 10);
        joe.affiche();
        joe.move(10);
        bogoss.affiche();
        joe.affiche();
        joe.descend();
        joe.setDir(66, 66);
        joe.move(10);
        joe.affiche();
        bogoss.affiche();

    }
}
