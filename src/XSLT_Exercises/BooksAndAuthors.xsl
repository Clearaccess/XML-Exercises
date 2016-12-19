<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <style>
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
            Table #1
        </h3>

        <table>
            <tr>
                <td>
                    Num
                </td>

                <td>
                    Title
                </td>

                <td>
                    Author
                </td>

                <td>
                    Price
                </td>
            </tr>
            <xsl:for-each select="catalog/book/title">

                <xsl:sort select="../price" data-type="number" order="descending"/>

                <xsl:sort select="substring-after(../author,', ')" data-type="text" order="descending"/>

                <tr>
                    <td>
                        <xsl:value-of select="position()"/>
                    </td>

                    <td>
                        <xsl:value-of select="text()"/>
                    </td>

                    <td>
                        <xsl:value-of select="substring-after(../author,', ')"/>
                    </td>

                    <td>
                        <xsl:value-of select="../price"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>

        <h3>
            Table #2
        </h3>

        <table>
            <tr>
                <td>
                    Num
                </td>
                <td>
                    Title
                </td>
                <td>
                    Author
                </td>
                <td>
                    Price
                </td>
            </tr>
            <xsl:apply-templates select="catalog/book/title">
                <xsl:sort select="../price" data-type="number" order="descending"/>
                <xsl:sort select="substring-after(../author,', ')" order="descending"/>
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <xsl:template match="author"/>

    <xsl:template match="title">
        <tr>
            <td>
                <xsl:value-of select="position()"/>
            </td>

            <td>
                <xsl:value-of select="text()"/>
            </td>

            <td>
                <xsl:value-of select="substring-after(../author,', ')"/>
            </td>

            <td>
                <xsl:value-of select="../price"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="genre"/>

    <xsl:template match="price"/>

    <xsl:template match="publish_date"/>

    <xsl:template match="description"/>
</xsl:stylesheet>