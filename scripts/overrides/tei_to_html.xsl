<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:whitman="http://www.whitmanarchive.org/namespace"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
  exclude-result-prefixes="xsl tei xs whitman">
  
  <!-- ==================================================================== -->
  <!--                             IMPORTS                                  -->
  <!-- ==================================================================== -->
  
  <xsl:import href="../.xslt-datura/tei_to_html/tei_to_html.xsl"/>
  <xsl:import href="../../../whitman-scripts/scripts/archive-wide/overrides.xsl"/>

  
  
  <!-- To override, copy this file into your collection's script directory
    and change the above paths to:
    "../../.xslt-datura/tei_to_html/lib/formatting.xsl"
 -->
  
  <!-- For display in TEI framework, have changed all namespace declarations to http://www.tei-c.org/ns/1.0. If different (e.g. Whitman), will need to change -->
  <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
  
  <!-- add overrides for this section here -->

  <!-- this is an experiment for delSpan - it almost works, but since it is matching on text() only text will come through (all other encoding just dissapears). is there a way to rework this? 
  this solution came from https://stackoverflow.com/questions/3495447/xslt-with-overlapping-elements -->
  
  <!-- rend = hashmark vs @rend = overstrike -->
  <xsl:template match="text()[preceding::delSpan[1]/substring-after(@spanTo,'#')=following::anchor[1]/@xml:id]">
    <xsl:if test="normalize-space(.) != ''">
      <span class="tei_delspan">
        <xsl:copy-of select="."/>
      </span>
    </xsl:if>
  </xsl:template>
  
  
  
  
</xsl:stylesheet>
