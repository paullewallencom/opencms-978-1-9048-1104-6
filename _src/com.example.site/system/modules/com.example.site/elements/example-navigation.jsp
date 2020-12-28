<%@ page session="false"
  import="java.util.Iterator, 
          java.util.ArrayList,
          com.opencms.flex.jsp.CmsJspNavBuilder,
          com.opencms.flex.jsp.CmsJspNavElement,
          com.opencms.flex.jsp.CmsJspActionElement"
%>
<%
/*
 * Provides basic site navigation.
 */

// This constructor does initialization itself. 
// No need to call init() 
CmsJspActionElement cms = 
  new CmsJspActionElement(pageContext, request, response);

// Get navigation info
CmsJspNavBuilder navigation = cms.getNavigation();
ArrayList navItems = navigation.getNavigationForFolder();
Iterator i = navItems.iterator();

// Loop through all of the items in the ArrayList and print the
// menu.
while (i.hasNext()) {
  CmsJspNavElement navElement = (CmsJspNavElement)i.next();
  String link = cms.link(navElement.getResourceName());
  String title = navElement.getTitle();
  out.println("<a href=\"" + link + "\">" + title + "</a><br/>");
}
%>



