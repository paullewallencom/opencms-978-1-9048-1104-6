<%@ page import="com.opencms.flex.jsp.CmsJspActionElement" %>
<%
/*
 * Parses a CSV file and prints it in a table.
 * PARAMS:
 * csv_file: The name of the csv_file.
 */
CmsJspActionElement cms = 
  new CmsJspActionElement(pageContext, request, response);
String csvFile = request.getParameter("csv_file");

String csvContents = cms.getContent(csvFile);
if(csvContents == null || csvContents.length() == 0 ||
  csvContents.equals("??? null ???")) {
  out.println("<h2>CSV file has no contents!</h2>");
} else {
  // Split rows
  String [] rows = csvContents.split("\n");
  if(rows.length > 1) {
    // These will hold data from the CSV.
    String [] headers, items;
    int i, j; // Counters

    out.println("<table class=\"csv-table\"><tr>");
    // Assume first row is header info.
    headers = rows[0].split(",");
    for(i = 0; i < headers.length; ++i) {
      out.println("<th>"+headers[i]+"</th>");
    }
    out.println("</tr>");
    for(i = 1; i < rows.length; ++i) {
      out.print("<tr>");
      items = rows[i].split(",");
      for(j = 0; j < items.length; ++j) {
        out.println("<td>" + items[j] + "</td>");
      }
      out.print("</tr>");
    }
    out.println("</table>");
  } else out.print("No data");
}
%>