<%@ page session="false" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%
// If a param q is found, it is placed in the text box.
String qval = request.getParameter("q");
if(qval == null) qval = "";
%>
<form method="GET" action="<cms:link>/playground/search_results.jsp</cms:link>">
  Search: 
  <input type="text" name="q" value="<%= qval %>"/>
  <input type="submit" value="Go"/>
</form>