<%@ page session="false" 
import="java.util.ResourceBundle, 
        java.util.PropertyResourceBundle, 
        java.util.Locale,
        com.opencms.flex.jsp.CmsJspActionElement,
        com.opencms.file.CmsObject" %>
<%
  CmsJspActionElement cms = 
    new CmsJspActionElement(pageContext, request, response);
  CmsObject cmso = cms.getCmsObject();
  String resource = cms.info("opencms.request.uri");
  Locale myLocale = Locale.ENGLISH; // default

  // true tells readProperty to look in parent properties.
  String language = cmso.readProperty(resource, "locale", true);  

  if(language != null && !"".equals(language)) myLocale = new Locale(language);

  String bundle = "com.example.site.labels";
  ResourceBundle labels = PropertyResourceBundle.getBundle(bundle, myLocale);

  out.println(labels.getString("greeting"));
%>