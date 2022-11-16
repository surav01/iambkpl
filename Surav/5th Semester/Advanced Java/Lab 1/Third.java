import java.awt.*;
public class Third{
	Third(){
		frame f = new frame();
		Dimension d = new Dimension(400,400);
		f.setTitle("Hello World");
		Button b = new Button("Hello");
		b.setSize(10,50,30,10);
		f.setLayout(null);
		f.add(b);
		
		f.setSize(d);
		f.setVisible(true);
	}
	public static void main(String args[]){
		Third fi = new Third();
	}
}
