import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Testmain {
	public static void main(String Argv[])
	{
		try {
			String name=new String("MyfirstMasmProg");
			String temp=new String("");
			String data=new String("");
			String code=new String("");
			
			BufferedReader reader=null;
			reader=new BufferedReader(new  FileReader("data.txt"));
			while((temp=reader.readLine())!=null)
				data+=temp+"\r\n";
			reader=new BufferedReader(new  FileReader("code.txt"));
			while((temp=reader.readLine())!=null)
				code+=temp+"\r\n";
		
			Linker.LinkEntrance(data,code,name);
			//System.out.println("END TEST");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
