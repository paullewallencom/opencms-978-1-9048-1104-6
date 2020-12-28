<%@ page session="false" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>

<cms:template element="head">
  <cms:include file="../elements/check_login.jsp" />
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
      <cms:include file="../elements/example-navigation.jsp"/>
      <a href="/playground/logout.jsp">Logout</a>
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