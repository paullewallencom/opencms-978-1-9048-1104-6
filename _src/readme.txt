1) After OpenCms is installed on a system, replace $CATALINA_HOME/webapps/opencms/WEB-INF/lib/opencms.jar with opencms-custom.jar. opencms-custom.jar has the custom resource type (chapter 6) built in.

2) In OpenCms' Admistration view, go to Module management and click the upload (up-arrow) icon. Import both the com.example.site module and the com.example.genericxml.xslt modules.

* The site module contains all of the site-specific code (see chapter 4).

* The genericxml.xslt module is the module created in chapters 5-7.

3) You will need to make changes to your registry.xml file as explained in chapters 5, 6, and 7.

To use the genxml resource type, you will also have to add the genxml resource type file (provided with the download) to /system/workplace/restypes/.

The author's registry.xml and opencms.properties files that can be used for reference. Only the <restype/> and <launchers/> sections need to be modified in the registry.xml (See chapter 7).

4) Restart the servlet engine (don't just reload the servlet).

NOTE:
The genericxml-src file contains all of the Java source code used in the book. This code is Javadoc'ed. Also included, is a commented ant build.xml script. To build, some path info in that file may need modification. The Lucene code is not required, so if you do not have the lucene.jar file in your classpath, it is safe to comment that out of the build script.
