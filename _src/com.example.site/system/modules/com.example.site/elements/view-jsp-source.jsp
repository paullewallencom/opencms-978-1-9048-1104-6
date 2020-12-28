<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.file.CmsObject,
                 com.opencms.file.CmsFile,
                 com.opencms.util.Encoder,
                 com.opencms.file.I_CmsResourceType" 
%>
<%
CmsJspActionElement cms = 
  new CmsJspActionElement( pageContext, request, response );

// view my own source. ;-)
String myFileName = cms.info("opencms.request.uri");
//String myFileName = "/playground/index.html";

CmsObject cmso = cms.getCmsObject();

CmsFile myFile = cmso.readFile( myFileName );

/*
 * This checks to make sure the code is a JSP file. Since
 * CmsFile.getType() returns an int, we have to get the
 * int that correlates to the type "jsp" from an impl of
 * I_CmsResourceType.
 *
 * Yes, it is odd that the two methods have the same name.
 */
//if( myFile.getType() == 
//    cmso.getResourceType("jsp").getResourceType() ) {

  String myFileTitle = cmso.readProperty( myFileName, "title");

  // Encode any "<",">" and "&" in the JSP.
/*
  StringBuffer sb = new StringBuffer();
  byte [] fileContents = myFile.getContents();
  for( int i = 0; i < fileContents.length; ++i ) {
    if( fileContents[i] == '<' ) {
      sb.append( "&lt;" );
    } else if (fileContents[i] == '>' ) {
      sb.append( "&gt;" );
    } else if (fileContents[i] == '&' ) {
      sb.append( "&amp;" ); 
    } else {
      // Definitely NOT Unicode friendly
      sb.append( (char)fileContents[i] );
    }
  }

  String fileSourceText = sb.toString();
*/
  String fileSourceText = Encoder.escapeHtml( new String( myFile.getContents() ));
  out.println( "<h1>Source of: " + myFileTitle + "</h1>" );
  out.print( "<pre>" + fileSourceText + "</pre>" );

//} else {
//  out.println( "<h2>" + myFileName + "is not a JSP.</h2>" );
//}

%>