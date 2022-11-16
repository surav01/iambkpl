import java.awt.*;
public class Second{
	Second(){
		frame f = new frame();
		Dimension d = new Dimension(400,400);
		f.setTitle("My First GUI Program");
		f.setSize(d);
		f.setVisible(true);
	}
	public static void main(String args[]){
		Second fi = new Second();
	}
}
