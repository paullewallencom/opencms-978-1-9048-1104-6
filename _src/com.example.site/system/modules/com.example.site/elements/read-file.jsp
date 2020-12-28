<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.file.CmsObject,
                 com.opencms.file.CmsFile,
                 com.opencms.file.CmsResource" 
%>
<%
CmsJspActionElement cms = 
  new CmsJspActionElement( pageContext, request, response );

String myFileName = "/playground/myfile.txt";

CmsObject cmso = cms.getCmsObject();

CmsFile myFile = cmso.readFile( myFileName );
String myFileTitle = cmso.readProperty( myFileName, "title");

out.println( "<h1>" + myFileTitle + "</h1>" );
out.print( new String( myFile.getContents() ));

%>