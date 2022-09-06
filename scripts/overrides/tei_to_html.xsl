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
  
  <!-- For display in TEI framework, have changed all namespace declarations to http://www.tei-c.org/ns/1.0. If different (e.g. Whitman), will need to change -->
  <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
  
  <!-- add overrides for this section here -->
  
  <xsl:variable name="top_metadata">
    <ul>
      <li><strong>Title: </strong> <xsl:value-of select="//title[@type='main']"/></li>
      <li><strong>Creator: </strong> <xsl:value-of select="//titleStmt/author"/></li>
      <li><strong>Date: </strong> <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date"/></li>
      <li><strong>Whitman Archive ID: </strong> <xsl:value-of select="//teiHeader/fileDesc/publicationStmt/idno"/></li>
      <li><strong>Source: </strong> <xsl:apply-templates select="//teiHeader/fileDesc/sourceDesc/bibl/orgName"></xsl:apply-templates></li>
      <li><strong>Editorial note: </strong><xsl:apply-templates select="//teiHeader/fileDesc/notesStmt/note[@type='project']"></xsl:apply-templates> </li>
      <li><strong>Contributors to digital file: </strong> <xsl:value-of separator=", " select="//teiHeader/fileDesc/titleStmt/respStmt/persName"></xsl:value-of></li>
    </ul>
  </xsl:variable>
  
</xsl:stylesheet>
