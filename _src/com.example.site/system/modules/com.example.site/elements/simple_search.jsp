<%@ page import="net.grcomputing.opencms.search.lucene.SearchHelper, org.apache.lucene.search.Hits,
    org.apache.lucene.document.*, com.opencms.flex.jsp.*, java.util.Date" %>
<%--
This element displays simple search results.

To use it, use <cms:import page="/system/modules/net.grcomputing.opencms.search.lucene/elements/simple-search.jsp"/>

This element expexts the parameter "q" to be set to the query string. Thus, the serach form element
should look something like this:
<input type="text" name="q" value="your search string here">

For more complex searches, you may want to write your own searcher (rather than use the one
that came in SearchHelper). Read the normal Lucene documents at http://jakarta.apache.org/lucene
for more information on writing one. The SearchHelper class provides the info that you need to 
build a new searcher.

If this isn't clear, email the opencms-dev list, and people (including myself) will help you.
--%>
<%
String REG_PATH = "/opt/tomcat/webapps/opencms/WEB-INF/config/lucene-registry.xml";
CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

// This class has a bunch of useful methods for searching.
//SearchHelper search = new SearchHelper(cms);
/*
 * If you need to specify an alternate registry, construct a SearchHelper like this:
 */
SearchHelper search = new SearchHelper(cms.getCmsObject(), REG_PATH);


// Get the GET/POST parameter named "q"
String query = request.getParameter("q");
if(query != null) {
    // This does a text search using the query provided. 
    // org.apache.lucene.hits are returned.
    Hits hits = search.doSimpleSearch(query);
    //out.println("Hits");

    int i, j = hits.length();

    if(j == 0) {
        out.println("<h2>Your search found no matches. Please try again.</h2>");
    } else {
        float score;
        Document doc;
        String tLastMod;
        if(j == 1)
            out.println("<h2 class=\"search-mathces\">Your search found 1 match.</h2>");
        else
            out.println("<h2 class=\"search-matches\">Your search found " + Integer.toString(j) + " matches.</h2>");

        // For each hit, get the Document and print out some information (including a link) about each item that
        // matches.
        for(i = 0; i<j; ++i) {
            score = hits.score(i);
            doc = hits.doc(i);
            String lms = doc.get("last_modified");
            if(lms != null && !"".equals(lms))
                tLastMod = DateField.stringToDate(lms).toString();
            else tLastMod = "unknown";
            
            //tLastMod = "unknown";
            out.println("<p class=\"search-hit\"><b class=\"search-hit-title\">" 
                + "<a href=\"" + cms.link(doc.get("abs_path")) + "\" class=\"search-hit-link\">"
                + doc.get("title") + "</a></b><br><i class=\"search-hit-score\">");
            //out.print(score); // Score is between 0.0 and 1.0
            out.println("</i> " + doc.get("description") + " <br><span class=\"smalltext\">(Last modified: " + tLastMod + ")</span></p>");
        }
    }
} else {
    out.println("No results found.");
}
%>