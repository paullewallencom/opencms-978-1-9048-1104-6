<%@ page session="false" 
  import="com.opencms.flex.jsp.CmsJspActionElement,
          com.opencms.file.CmsObject,
          com.opencms.file.CmsResource"
%>
<%
CmsJspActionElement cms = new CmsJspActionElement( pageContext, 
                                                   request, 
                                                   response );
CmsObject cmso = cms.getCmsObject();
String rootName="/default/vfs";
String myAbsPath, myTitle;
CmsResource myResource;

// Here's our test String:
String resourceName = "/default/vfs/playground/myfile.txt";

if(resourceName.startsWith( rootName )) {
  myAbsPath = resourceName.substring( rootName.length() );
} else {
  myAbsPath = resourceName;
}
myTitle = cmso.readProperty(myAbsPath, "title");

out.println("<h2>" + myTitle + "</h2>" );

%>
