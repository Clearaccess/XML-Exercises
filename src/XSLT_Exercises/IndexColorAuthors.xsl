<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:variable name="numberAuthorOfCatalog" select="count(catalog/author)"/>
    <xsl:variable name="numberAuthorOfBook" select="count(catalog/book/author)"/>

    <xsl:template match="/">
        <style>
            .even{
                background-color: gray;
            }

            .uneven{
                background-color: silver;
            }

            table{
            border-style: solid;
            border-color: black;
            border-width: thin;
            }

            td{
            border-style: solid;
            border-color: black;
            border-width: thin;
            }

            tr{
            border-style: solid;
            border-color: black;
            border-width: thin;
            }
        </style>

        <h3>
            Catalog/Author
        </h3>

        <table>
            <tr>
                <td>
                    Num
                </td>
                <td>
                    Author
                </td>
            </tr>
            <xsl:apply-templates select="catalog/author">
                <xsl:sort select="substring-after(text(),', ')"/>
            </xsl:apply-templates>
        </table>

        <br/>

        <xsl:value-of select="$numberAuthorOfCatalog"/>

        <h3>
            Catalog/Book/Author
        </h3>
        <table>
            <tr>
                <td>
                    Num
                </td>
                <td>
                    Author
                </td>
            </tr>
            <xsl:apply-templates select="catalog/book/author">
                <xsl:sort select="substring-after(text(),', ')"/>
            </xsl:apply-templates>
        </table>

        <br/>

        <xsl:value-of select="$numberAuthorOfBook"/>
    </xsl:template>

    <xsl:template match="author">
        <xsl:if test="position() mod 2=0">
            <tr class="even">
                <td>
                    <xsl:value-of select="position()"/>
                </td>
                <td>
                    <xsl:value-of select="text()"/>
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="position() mod 2=1">
            <tr class="uneven">
                <td>
                    <xsl:value-of select="position()"/>
                </td>
                <td>
                    <xsl:value-of select="text()"/>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match="title"/>

    <xsl:template match="genre"/>

    <xsl:template match="price"/>

    <xsl:template match="publish_date"/>

    <xsl:template match="description"/>
</xsl:stylesheet>