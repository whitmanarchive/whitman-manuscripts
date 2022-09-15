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
<!--  
  <p><span class="bold">Source: </span>
    -<xsl:variable name="orgNames" select="count(TEI//sourceDesc/bibl[1]/orgName)"/>
    -<xsl:apply-templates select="TEI//sourceDesc/bibl[1]/orgName[1]"/>
    -<xsl:if test="TEI//sourceDesc/bibl[1]/orgName[2]">; <xsl:apply-templates select="TEI//sourceDesc/bibl[1]/orgName[2]"/></xsl:if>
    -<xsl:if test="not(ends-with(TEI//sourceDesc/bibl[1]/orgName[$orgNames],'.'))">.</xsl:if>
    -<xsl:text>  </xsl:text>
    -<xsl:apply-templates select="TEI//sourceDesc//bibl/note[@type='project'][not(@target)]"/> 
    For a description of the editorial rationale behind our treatment of the marginalia and annotations, see our <a href="{$site_url}about/editorial.html#marginalia">statement of editorial policy</a>.
  </p>-->
  
  <xsl:variable name="top_metadata">
    <ul>
      <li><strong>Title: </strong> <xsl:value-of select="//title[@type='main']"/></li>
      <li><strong>Creator: </strong> <xsl:value-of select="//titleStmt/author"/></li>
      <li><strong>Date: </strong> <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date"/></li>
      <li><strong>Whitman Archive ID: </strong> <xsl:value-of select="//teiHeader/fileDesc/publicationStmt/idno"/></li>
      
      <li><strong>Source: </strong> 
        <!--<xsl:variable name="orgNames" select="count(TEI//sourceDesc/bibl[1]/orgName)"/>
        <xsl:apply-templates select="TEI//sourceDesc/bibl[1]/orgName[1]"/>
        <xsl:if test="TEI//sourceDesc/bibl[1]/orgName[2]">
          <xsl:text>; </xsl:text>
          <xsl:apply-templates select="TEI//sourceDesc/bibl[1]/orgName[2]"/>
        </xsl:if>
        <xsl:if test="not(ends-with(TEI//sourceDesc/bibl[1]/orgName[$orgNames],'.'))">
          <xsl:text>.</xsl:text>
        </xsl:if>
        <xsl:text>  </xsl:text>
        <xsl:apply-templates select="TEI//sourceDesc//bibl/note[@type='project'][not(@target)]"/>
        <xsl:text>For a description of the editorial rationale behind our treatment of the marginalia and annotations, see our </xsl:text>
        <a>
          <xsl:attribute name="htref">
            
          </xsl:attribute>
          <xsl:text>statement of editorial policy</xsl:text>
        </a>-->
        <xsl:choose>
          <xsl:when test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct[not(@type='supplied')]">
            <xsl:text>The transcription presented here is derived from </xsl:text> 
            <!-- if author -->
            <xsl:if test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/author">
              <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/author"/>
              <xsl:text>, </xsl:text>
            </xsl:if>
            <!-- monograph title -->
            <em><xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/title"/></em>
            <!-- if editor // todo: simplify, should work if more than 2 editors -->
            <xsl:if test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/editor">
              <xsl:text>, ed. </xsl:text>
              <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/editor[1]"/>
              <xsl:if test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/editor[2]">
                <xsl:text> and </xsl:text>
                <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr/editor[2]"/>
              </xsl:if>
            </xsl:if>
            <!-- publisher and date -->
            <xsl:text> (</xsl:text>
            <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//pubPlace"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//publisher"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//date"/>
            <xsl:text>)</xsl:text>
            <xsl:text>, </xsl:text>
            <!-- if volume -->
            <xsl:if test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//biblScope[@type='volume']">
              <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//biblScope[@type='volume']"/>
              <xsl:text>:</xsl:text>
            </xsl:if>
            <!-- page -->
            <xsl:value-of select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/monogr//biblScope[@unit='page']"/>
            <xsl:text>. </xsl:text>
            <!-- project -->
            <xsl:if test="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/note[@type='project']">
              <xsl:apply-templates select="TEI/teiHeader/fileDesc/sourceDesc/biblStruct/note[@type='project']"/>
            </xsl:if>
            <xsl:text> </xsl:text>
            <!-- orgname // dodo: simplify -->
            <xsl:value-of select="TEI//sourceDesc//bibl[1]/orgName"/>
            <xsl:if test="TEI//sourceDesc//bibl[2]/orgName">
              <xsl:text>; </xsl:text>
              <xsl:value-of select="TEI//sourceDesc//bibl[2]/orgName"/>
            </xsl:if>
          </xsl:when>
          <!-- orgname // not sure if this will ever hit for manuscripts -->
          <xsl:otherwise>
            <xsl:value-of select="//TEI//sourceDesc//bibl[1]/orgName"/>
            <xsl:if test="TEI//sourceDesc//bibl[2]/orgName">
              <xsl:text>; </xsl:text>
              <xsl:value-of select="TEI//sourceDesc//bibl[2]/orgName"/>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        
        <!-- orgname // todo: simplify -->
        <xsl:choose>
          <xsl:when test="count(//TEI//sourceDesc//bibl) > 1 and //tei//sourceDesc//bibl[2]/orgname">
            <xsl:if test="not(ends-with(//TEI//sourceDesc//bibl[2]/orgName, '.'))">
              <xsl:text>.</xsl:text>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="not(ends-with(//TEI//sourceDesc//bibl[1]/orgName, '.'))">
              <xsl:text>.</xsl:text>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>  </xsl:text>
        
        <!-- project -->
        <xsl:apply-templates select="//TEI//sourceDesc//bibl[1]/note[@type = 'project'][not(@target)]"/>
        
        <!-- editorial statement -->
        <xsl:text>For a description of the editorial rationale behind our treatment of the manuscripts, see our </xsl:text>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$site_url"/>
            <xsl:text>/about/editorial</xsl:text>
          </xsl:attribute>
          <xsl:text>statement of editorial policy</xsl:text>
        </a>
        <xsl:text>.</xsl:text>
      </li>
      
      
      
      
      
      
      
      
      
      
      <li><strong>Editorial note: </strong><xsl:apply-templates select="//teiHeader/fileDesc/notesStmt/note[@type='project']"/> </li>
      
      
      
      
      
      
      
      <!-- pulled from notebooks P5 tylesheet and refactored original comment: relatedItem section (updated 4/28/17)-->
      <xsl:if test="//sourceDesc//relatedItem">
        <li><strong>Related Item(s): </strong>
          <ul>
            <xsl:for-each select="//relatedItem[@type = 'text']">
              <li>
                <xsl:variable name="note_target"><xsl:text>#</xsl:text><xsl:value-of select="@xml:id"/></xsl:variable>
                <!-- if there is a note with a matching target, display -->
                <xsl:apply-templates select="//note[@target=$note_target]"/>
                <xsl:text>See </xsl:text>
                <a>
                  <xsl:attribute name="href" select="@target"/>
                  <xsl:value-of select="@target"/>
                </a>
                <xsl:text>.</xsl:text></li>
            </xsl:for-each>
            
            <xsl:for-each select="//relatedItem[@type = 'document']">
              <li>
                <xsl:text>See </xsl:text>
                <a>
                  <xsl:attribute name="href" select="@target"/>
                  <xsl:value-of select="@target"/>
                </a>
                <xsl:text>.</xsl:text>
              </li>
            </xsl:for-each>
          </ul>          
        </li>
      </xsl:if>
      
      <!--end relatedItem section-->
      
      
      
      
      
      
      
      
      <li><strong>Contributors to digital file: </strong> <xsl:value-of separator=", " select="//teiHeader/fileDesc/titleStmt/respStmt/persName"></xsl:value-of></li>
    </ul>
  </xsl:variable>
  
</xsl:stylesheet>
