import java.awt.Color;

public abstract class Personne extends Displayable {
    int dx, dy, v;

    Personne(int x, int y, Color c) {
        super(x, y, c);
        v = 0;
        dx = 0;
        dy = 0;
    }
}