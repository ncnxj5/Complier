//mblue 2015/12/18 tester

public class Testmain {
	public static void main(String Argv[])
	{
	//the test case is to write out a hello world! 23333
		String con=new String(".data\r\n	szFmt db 'HelloWorld -1:%d| ', 0\r\n.code\r\nmain proc\r\n	mov eax,-1\r\n	invoke crt_printf, addr szFmt, eax\r\n	invoke crt_scanf\r\n    ret\r\nmain endp\r\n");
		String name=new String("MyfirstMasmProg");
		Linker.LinkEntrance(con,name);
		//System.out.println("END TEST!!");
	}
}
