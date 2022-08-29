<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:whitman="http://www.whitmanarchive.org/namespace"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="xsl tei xs whitman">
    
    <xsl:output omit-xml-declaration="yes"></xsl:output>
    
    <xsl:template match="/">
        <xsl:variable name="collection_location">../../source/tei</xsl:variable>
        <xsl:for-each select="collection($collection_location)//pb/@facs">
            <xsl:sort select="."/>
            <xsl:value-of select="."/>
            <xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    
    
</xsl:stylesheet>