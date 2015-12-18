import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
/*==================*
 *| mblue 2015/12/18|
 *==================*/
public class Linker {
	//the head&tail part
	/* !!![warning] that the include path should change to fit the computer environment *
	 * !!![warning] that the include path should change to fit the computer environment *
	 * !!![warning] that the include path should change to fit the computer environment */
	static String head=new String(".386 \r\n.model flat, stdcall\r\n\r\ninclude  e:\\masm32\\include\\msvcrt.inc\r\nincludelib e:\\masm32\\lib\\msvcrt.lib\r\n");
	static String tail=new String("\r\nend main\r\n");
	/*============================================================================*
	 * Step1:
	 * 		Setup MASM
	 * ---------------------------------------------------------------------------*
	 * Step2:
	 * 		Add the Environmental Variable path "\masm32\bin" e.g."E:\masm32\bin"
	 * 
	 *============================================================================*/
	private static void writefile(String contents,String filename)
	{
		BufferedWriter writer=null;
		try {
			//attempt to out write the .asm out
			   writer=new BufferedWriter(new  FileWriter(filename+".asm"));
			} 
		catch (IOException e1) {
			  e1.printStackTrace();
			  System.out.println("[Linker]:>Oooops! File Opening Broken =w=");
			 }
		 try {
			  writer.append(head);
			  //write the header
			  writer.append(contents);
			  //write the contents;
			  writer.append(tail);
			  
			  writer.close();
			   System.out.println("[Linker]:>Write .ASM OUT Finished! :)");
			 } catch (IOException e) {
			  e.printStackTrace();
			  System.out.println("[Linker]:>Oooops! My Pencil Broken -w=");
			 }
	}
	private static String executeCommond(String cmd) {  
		        String ret = "";  
		        try {
		        	//get the CMD process;
		            Process p = Runtime.getRuntime().exec(cmd);  
		            InputStreamReader ins = new InputStreamReader(p.getInputStream());  
		            LineNumberReader input = new LineNumberReader(ins);  
		            String line;  
		            while ((line = input.readLine()) != null) {  
		                System.out.println(line);  
		                ret += line + "<br>";  
		            }  
		        } catch (IOException e) {  
		            e.printStackTrace();  
		        }  
		        return ret;  
		    }  
	private static void objCreater(String filename)
	{
		try {
			//use the MASM /bin ml.exe to create OBJ file
		executeCommond("ml /c /coff "+filename+".asm");
		System.out.println("[Linker]:>Write .OBJ OUT Finished!");
		} 
		catch (Exception e) {  
            e.printStackTrace();
            System.out.println("[Linker]:>Oooops! Obj Broken -w=");
        }  
	}
	private static void objLinker(String filename)
	{
		try {
			//use the MASM /bin link.exe to create OBJ file
			// case that using /subsystem:console
			// but not /subsystem:windows! that will only can used by xxx.exe>out.txt
		executeCommond("link /subsystem:console "+filename+".obj");
		System.out.println("[Linker]:>Write .EXE OUT Finished! -O-");
		} 
		catch (Exception e) {  
            e.printStackTrace();
            System.out.println("[Linker]:>Oooops! EXE Broken -w=");
        }  
	}
	public static void LinkEntrance(String con,String name)
	{
		writefile(con,name);
		//write ASM file
		objCreater(name);
		//create OBJ file
		objLinker(name);
		//create EXE file
	}
	public static void setHead(String header_i)
	{
		//change head if you want...
		head=header_i;
	}
	public static void setTail(String tail_i)
	{
		//change tail if you want... orz
		tail=tail_i;
	}
}
