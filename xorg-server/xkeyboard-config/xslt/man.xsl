<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
<xsl:output method="text" encoding="UTF-8" doctype-system="xkb.dtd"/>
<xsl:template match="/xkbConfigRegistry"><![CDATA[.\" WARNING: this man page is autogenerated. Do not edit or you will lose all your changes.
.TH XKEYBOARD-CONFIG __miscmansuffix__ __vendorversion__
.SH NAME
xkeyboard-config \- XKB data description files
.SH DESCRIPTION
xkeyboard-config provides the description files for the X Keyboard
Extension (XKB). The configuration options below are usually applied with
setxkbmap.
.SH MODELS
.TS
l l
___
lB l.
model	description ]]>
<xsl:apply-templates select="modelList"/>
<![CDATA[
.TE
.SH LAYOUTS
.TS
l l l
____
lB lB l.
layout	variant	description ]]>
<xsl:apply-templates select="layoutList"/>
<![CDATA[
.TE
.SH OPTIONS
]]>
<xsl:apply-templates select="optionList"/>
<![CDATA[
.SH SEE ALSO
setxkbmap(__appmansuffix__)
]]>
</xsl:template>

<!-- split model/description into a normal table -->
<xsl:template match="modelList">
    <xsl:for-each select="model">
        <xsl:value-of select="configItem/name"/><xsl:text>	</xsl:text><xsl:value-of select="configItem/description"/>
<xsl:text>
</xsl:text>
</xsl:for-each>
</xsl:template>

<!-- split layout/variant/description into a table like this

        layout1                 description
                variant1        description
                variant2        description
        layout2                 description
                variant1        description
-->
<xsl:template match="layoutList">
<xsl:for-each select="layout">
<xsl:value-of select="configItem/name"/><xsl:text>		</xsl:text><xsl:value-of select="configItem/description"/>
<xsl:text>
</xsl:text>
<xsl:for-each select="variantList/variant">
<xsl:text>	</xsl:text><xsl:value-of select="configItem/name"/><xsl:text>	</xsl:text><xsl:value-of select="configItem/description"/>
<xsl:text>
</xsl:text>
</xsl:for-each>
<xsl:text>
</xsl:text>
</xsl:for-each>
</xsl:template>

<!-- split option into a table like this

option description:
        optarg          description
        optarg          description
        optarg          description

option2 description:
        optarg          description
        optarg          description
-->
<xsl:template match="optionList">
<xsl:for-each select="group">
<![CDATA[
.SS]]> <xsl:value-of select="configItem/description"/>
<![CDATA[
.BR
.TS
l l
___
lB l.
option	description ]]>
<xsl:for-each select="option">
<xsl:value-of select="configItem/name"/><xsl:text>	</xsl:text><xsl:value-of select="configItem/description"/>
<xsl:text>
</xsl:text>
</xsl:for-each>
<![CDATA[
.TE

]]>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
