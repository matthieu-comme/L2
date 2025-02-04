import java.awt.Graphics;
import java.awt.Color;

public abstract class Personne extends Displayable {
    int dx, dy, v;

    public Personne(int x, int y, Color c) {
        super(x, y, c);
        v = 0;
        dx = 0;
        dy = 0;
    }
        protected void setRandomDirection() {
        this.dx = (int) (Math.random() * 2000) - 1000;
        this.dy = (int) (Math.random() * 1600) - 800;
    }
        protected void move(int t) { // t = temps de deplacement
        x += (dx * v * t) / Math.sqrt(dx * dx + dy * dy);
        y += (dy * v * t) / Math.sqrt(dx * dx + dy * dy);
    }
    @Override
    void paint(Graphics g){
  		int tx = x +(dx * v * 1) / (int)Math.sqrt(dx * dx + dy * dy);
        		int ty = y + (dy * v * 1) / (int)Math.sqrt(dx * dx + dy * dy);
		g.setColor(this.c);
		g.fillOval(this.x-this.radius,this.y-this.radius,2*this.radius,2*this.radius);
		g.setColor(Color.RED);
		g.drawLine(x,y,tx,ty);
	}
}
