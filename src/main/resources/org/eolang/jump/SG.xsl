<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" id="SG" version="2.0">
    <!--
    Simple goto
    -->
    <xsl:output indent="yes" method="xml"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match='o[@base=".forward" or @base=".backward"]'>
        <xsl:choose>
            <xsl:when test='parent::o[@base=".if"][o[2][@base=".forward" or @base=".backward"]]'>
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="o">
                    <xsl:attribute name="base"><xsl:text>.if</xsl:text></xsl:attribute>
                    <xsl:element name="o">
                        <xsl:attribute name="base"><xsl:text>org.eolang.bool</xsl:text></xsl:attribute>
                        <xsl:attribute name="data"><xsl:text>bool</xsl:text></xsl:attribute>
                        <xsl:text>true</xsl:text>
                    </xsl:element>
                    <xsl:copy-of select="."/>
                    <xsl:element name="o">
                        <xsl:attribute name="base"><xsl:text>org.eolang.bool</xsl:text></xsl:attribute>
                        <xsl:attribute name="data"><xsl:text>bool</xsl:text></xsl:attribute>
                        <xsl:text>true</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match='node()|@*'>
        <xsl:copy>
            <xsl:apply-templates select='node()|@*'/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>