<%@ page import="com.opencms.file.*,com.opencms.flex.jsp.CmsJspActionElement"

%>
<html><head><title>Touch All Resources</title></head>
<body>
<h1>Touch All Resources in VFS</h2>
<p>WARNING: Make sure all users are logged out, as 
they will lose their work if they have files open
during this operation.</p>
<p>This may take a while.</p>
<%
CmsJspActionElement cmsjsp = new CmsJspActionElement( pageContext, request, response );
CmsObject cms = cmsjsp.getCmsObject();

// Directories to skip.
//String except = request.getParameter( "except" );
//String [] exceptList = except.split(",");
long timestamp = 0;

try {
cms.lockResource( "/", true );
cms.touch( "/", timestamp, true );
cms.unlockResource( "/" );
} catch (Exception e) {
  e.toString();
}
%>
<h2>Done</h2>
</body>
</html>