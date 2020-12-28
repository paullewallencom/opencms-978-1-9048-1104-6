<%@ page session="false" 
  import="com.opencms.flex.jsp.CmsJspActionElement,
          com.opencms.file.CmsObject,
          com.opencms.file.CmsFile,
          java.util.Iterator"
%>
<table class="dir-list">
  <tr><th>File Name</th><th>Absolute Path</th><th>Size</th></tr>
<%
/*
 * Print list of files in the directory.
 * PROPERTY:
 * param_fetch_dir: Directory to examine. 
 */
CmsJspActionElement cms = new CmsJspActionElement( pageContext, 
                                                   request, 
                                                   response );
String dir = cms.property( "param_fetch_dir" );

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
%>
</table>`````````