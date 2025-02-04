import java.awt.Color;
import java.lang.Math;

public class Touriste extends Personne {
    Touriste(int x, int y, Color c) {
        super(x, y, c);
        v = 3;
        this.setRandomDirection();
    }
    
    @Override
     public void move(int t) { // t = temps de deplacement
        if(Math.random() > 0.50) this.setRandomDirection();
        x += (dx * v * t) / Math.sqrt(dx * dx + dy * dy);
        y += (dy * v * t) / Math.sqrt(dx * dx + dy * dy);
    }
}
