<%@ page 
  import="java.util.Iterator, 
          java.util.ArrayList,
          com.opencms.flex.jsp.CmsJspNavBuilder,
          com.opencms.flex.jsp.CmsJspNavElement,
          com.opencms.flex.jsp.CmsJspActionElement"
%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>

<cms:template element="head">
  <html>
  <head>
    <title>
      <cms:property name="title" escapeHtml="true"/>
    </title>
  </head>
  <body>
    <div class="search" style="float:right; border: 1px solid gray; padding: 5px;">
      <cms:include file="../elements/search-form.jsp"/>
    </div>
    <div name="menu" 
      style="float:left; border: 1px solid gray; padding: 5px;">
      
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
    </div>
    <h1>
      <cms:property name="title" escapeHtml="true"/>
    </h1>
</cms:template>

<cms:template element="body">
  <cms:include element="body"/>
</cms:template>

<cms:template element="foot">
  </body>
  </html>
</cms:template>