import java.awt.Color;

public class Travailleur extends Personne {
    Travailleur(int x, int y) {
        super(x, y, Color.gray);
        v = 10;
        this.setRandomDirection();
    }

}
