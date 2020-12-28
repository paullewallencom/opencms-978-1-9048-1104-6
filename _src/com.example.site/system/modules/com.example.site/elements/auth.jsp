<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.core.CmsException,
                 com.opencms.file.CmsObject,
                 com.opencms.file.CmsUser"
%>
<%
CmsJspActionElement cmsjsp =
  new CmsJspActionElement( pageContext, request, response );
CmsObject cms = cmsjsp.getCmsObject();

String username = request.getParameter( "username" );
String password = request.getParameter( "password" );
boolean logout = "true".equals( request.getParameter( "logout" ));

if( logout ) {
  // Log in Guest
  cms.loginUser( cms.anonymousUser().getName(), "" );
}

if( username == null || "".equals( username )) {
  String currentUser = cmsjsp.user( "name" );

  if( currentUser != null &&
      ! "".equals( currentUser ) &&
      ! "guest".equals( currentUser.toLowerCase() )) {
    // User is logged in.
    out.println( "You are logged in as " + currentUser );
  }
} else {
  
  try {
    cms.loginWebUser( username, password );
    out.println( "You are logged in as " + cmsjsp.user( "name" ));
  } catch( CmsException e ) {
    out.println( "Login Failed." );
  }
}

%>