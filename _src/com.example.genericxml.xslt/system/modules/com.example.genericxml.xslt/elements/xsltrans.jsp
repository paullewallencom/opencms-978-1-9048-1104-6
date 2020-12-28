<%@ page import="com.opencms.flex.jsp.CmsJspActionElement, 
                 com.opencms.file.CmsObject,
                 com.example.genericxml.xslt.CmsXslTransformer" %>
<%

CmsJspActionElement cmsjsp = new CmsJspActionElement(pageContext,request, response);

String style = request.getParameter("xslt");
String source = request.getParameter("source_xml"); 

CmsObject cms = cmsjsp.getCmsObject();
CmsXslTransformer trans = new CmsXslTransformer( style, cms );

trans.transform( source, out );

%>