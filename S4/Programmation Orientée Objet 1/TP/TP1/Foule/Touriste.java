import java.awt.Color;
import java.lang.Math;

public class Touriste extends Personne {
    Touriste(int x, int y, Color c) {
        super(x, y, c);
        v = 1;
        dx = (int) (Math.random() % 1000);
        dy = (int) (Math.random() % 800);
    }

    public void move() {
        dx = (int) (Math.random() % 1000);
        dy = (int) (Math.random() % 800);
    }
}
