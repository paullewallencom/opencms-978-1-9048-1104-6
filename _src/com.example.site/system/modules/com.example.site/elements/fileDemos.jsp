<%@ page session="false" 
  import="com.opencms.flex.jsp.CmsJspActionElement,
          com.opencms.file.CmsObject,
          com.opencms.file.CmsFile,
          com.opencms.file.CmsFolder,
          com.opencms.file.CmsResource,
          java.util.Iterator"
%>
<%
CmsJspActionElement cms = new CmsJspActionElement( pageContext, 
                                                   request, 
                                                   response );
CmsObject cmso = cms.getCmsObject();
String folderName = "/playground/";

// Get an interator of the files in this folder:
Iterator i = cmso.getResourcesInFolder( folderName ).iterator();

CmsResource res;
while( i.hasNext() ) {
  res = (CmsResource) i.next();
  if ( res.isFile() ) {
    // Do something useful with the file....
    out.println(res.getAbsolutePath() + " is a file.<br/>");
  } else if ( res.isFolder() ) {
    // Do something useful with the folder....
    out.println(res.getAbsolutePath() + " is a folder.<br/>");
  } else {
    // Just in case...
    out.println( "<h2>Unknown resource!</h2>" );
  }
}
%>
<%
/*
if( dir != null && !"".equals( dir )) {
  CmsObject cmso = cms.getCmsObject();
  Iterator i = cmso.getFilesInFolder( dir ).iterator();
  int lines = 0;
  String filename, fileURL, unit, fileAbsPath;
  int filelength;
  CmsFile file;

  while( i.hasNext() ) {
    if( lines % 2 == 0 ) out.println( "<tr class=\"color1\">" );
    else out.println( "<tr class=\"color2\">" );
    ++lines;

    file = ( CmsFile )i.next();
    filename =  file.getName();
    fileAbsPath = file.getAbsolutePath();
    fileURL = cms.link( fileAbsPath );
    filelength = file.getLength();
    unit = "Kb";
    if( filelength < 1024 ) unit = "bytes";
    else filelength /= 1024;
    out.println( "<td><a href=\""+fileURL+"\">" + filename +
                 "</a></td><td>" );
    out.println( file.getResourceName() + "</td><td>" );
    out.println( filelength );
    out.println( unit + "</td></tr>" );
  }
} else out.println( "No directory" );
*/
%>
</table>