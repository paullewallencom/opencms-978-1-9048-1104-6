<%@ page import="com.opencms.flex.jsp.CmsJspActionElement,
                 com.opencms.core.CmsException,
                 com.opencms.core.I_CmsConstants,
                 com.opencms.util.MailUtils,
                 com.opencms.file.CmsObject,
                 com.opencms.file.CmsUser,
                 java.util.Hashtable"
%>
<%
String firstName = request.getParameter("fname");
String lastName = request.getParameter("lname");
String userName = request.getParameter("uname");
String email = request.getParameter("email");
String password1 = request.getParameter("pw1");
String password2 = request.getParameter("pw2");
String group = "Guests";

CmsJspActionElement cmsjsp =
    new CmsJspActionElement( pageContext, request, response );
CmsObject cms = cmsjsp.getCmsObject();

// Test each field
if ( userName == null || "".equals(userName) ) {
  throw new CmsException( "User Name is required." );
}else if ( email == null || "".equals(email) ) {
  throw new CmsException( "Email is required." );
}else if ( password1 == null || "".equals( password1 ) ) {
  throw new CmsException( "Password is required." );
}else if ( password2 == null || "".equals( password2 ) ) {
  throw new CmsException( "Password Again is required." );
} else if ( !MailUtils.checkEmail( email )) {
  throw new CmsException( "Email address must be valid." );
} else if ( !password1.equals( password2 )) {
  throw new CmsException( "Passwords do not match." );
} else if ( password1.length() < 7 ) {
  throw new CmsException( "Password must be at least 7 characters." );
}

boolean userExists = true;

// Test to see if user already exists.
try {
  cms.readUser( userName );
} catch ( CmsException e ) {
  // User does not exist -- that is good.
  userExists = false;
}
if ( userExists ) {
  throw new CmsException( "User "+ userName +" already exists." );
}

// Set default values for optional params.
if ( firstName == null ) {
  firstName = "";
}
if ( lastName == null ) {
  lastName = "";
}

// Hashtable for custom parameters
Hashtable params = new Hashtable();

CmsUser user = cms.addWebUser( userName,    // Username
                               password1,   // Password
                               group,       // Default Group
                               "Web User",  // Comment
                               params,      // Params Hashtable
                               I_CmsConstants.C_FLAG_ENABLED  // Activate 
);

user.setFirstname( firstName );
user.setLastname( lastName );
user.setEmail( email );
cms.writeWebUser( user ); // Write changes to DB.
%>