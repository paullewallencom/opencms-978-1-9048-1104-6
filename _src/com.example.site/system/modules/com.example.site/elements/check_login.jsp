<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.file.CmsObject"
%>
<%
String LOGIN_PAGE = "/playground/login.jsp";

CmsJspActionElement cmsjsp =
  new CmsJspActionElement( pageContext, request, response );
CmsObject cms = cmsjsp.getCmsObject();
String currentUser = cmsjsp.user( "name" );

if( currentUser == null &&
    "".equals( currentUser ) &&
    "guest".equals( currentUser.toLowerCase() )) {
  response.sendRedirect( LOGIN_PAGE );
}
%>