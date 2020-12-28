<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.file.CmsObject,
                 com.opencms.file.CmsFile,
                 com.opencms.file.I_CmsResourceType,
                 com.opencms.template.CmsXmlTemplateFile,
                 com.opencms.template.CmsXmlControlFile" 
%>
<%
CmsJspActionElement cms = 
  new CmsJspActionElement( pageContext, request, response );

String myFileName = "/playground/index.html";

CmsObject cmso = cms.getCmsObject();

CmsFile myFile = cmso.readFile( myFileName );

if( myFile.getType() == 
    cmso.getResourceType("page").getResourceType() ) {

  String myFileTitle = cmso.readProperty( myFileName, "title" );
  
  // Get the control code
  CmsXmlControlFile controlCode = new CmsXmlControlFile( cmso, myFile );

  // Get the name of the body file.
  String bodyFileName = controlCode.getElementTemplate("body");

  // Create a new CmsXmlTemplateFile object and get the contents
  // of the body file.
  CmsXmlTemplateFile bodyFile = new CmsXmlTemplateFile( cmso, bodyFileName);

  // Believe it or not, passing three nulls into the getTemplateContent
  // is perfectly legitimate. Neither of the first two parameters are used
  // anyway, and 'null' in the third instructs it to get the default
  // body. (It is possible to get a specific body, if you have multiple
  // bodies configured.)
  String bodyContents = bodyFile.getTemplateContent( null, null, null );

  out.println( "<h1>" + myFileTitle + "</h1>" );
  out.print( bodyContents );

} else {
  out.println( "<h2>" + myFileName + "is not a Page.</h2>" );
}

%>