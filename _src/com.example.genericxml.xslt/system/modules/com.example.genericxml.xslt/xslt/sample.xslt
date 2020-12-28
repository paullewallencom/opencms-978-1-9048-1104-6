<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/TR/xhtml1/strict"
  >
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="/basic/title"/></title>
        <style>
        body {
          font-family: sans-serif;
        }
        h1 {
          border-bottom: 1px dashed lightblue;
          border-left: 1px dashed lightblue;
        }
        em {
          font-size: 10pt;
        }
        </style>
      </head>
      <body>
        <h1><xsl:value-of select="/basic/title" /></h1>
        <p><xsl:value-of select="/basic/body"/></p>
        <hr/>
        <em>XSLT Processor:
        <xsl:value-of select="system-property('xsl:vendor')" />, ver. 
        <xsl:value-of select="system-property('xsl:version')" />
        (<xsl:value-of select="system-property('xsl:vendor-url')" />)on
        <xsl:value-of select="system-property('os.name')" /> 
        (<xsl:value-of select="system-property('os.arch')" />) 
        <xsl:value-of select="system-property('os.version')" />
        </em>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="*"/>
</xsl:stylesheet>