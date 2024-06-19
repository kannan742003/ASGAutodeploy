<%@ page import="java.net.InetAddress" %>
<%@ page import="java.net.NetworkInterface" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
    <title>Private Ip address</title>
</head>
<body>
    <h1>Private Ip address of Ec2 Instance:</h1>
    <p>
        <%
            try {
                Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
                while (interfaces.hasMoreElements()) {
                    NetworkInterface iface = interfaces.nextElement();
                    if (iface.isLoopback() || !iface.isUp())
                        continue;

                    Enumeration<InetAddress> addresses = iface.getInetAddresses();
                    while (addresses.hasMoreElements()) {
                        InetAddress addr = addresses.nextElement();
                        if (addr.isSiteLocalAddress()) {
                            out.print("Private IP Address: " + addr.getHostAddress());
                        }
                    }
                }
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
        %>
    </p>
</body>
</html>
