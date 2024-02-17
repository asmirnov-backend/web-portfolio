<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/">

        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />

                <title>Formula</title>
                <meta name="author" content="Andrew Smirnov" />
            </head>
            <body>
                <p>Equation</p>
                <math>
                    <xsl:apply-templates />
                </math>
                <h4 id="author" title="a2s">Андрей Смирнов (с)2024</h4>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="операнд">
        <mi>
            <xsl:apply-templates />
        </mi>
    </xsl:template>

    <xsl:template match="оператор">
        <mo>
            <xsl:apply-templates />
        </mo>
    </xsl:template>

    <xsl:template match="число">
        <mn>
            <xsl:value-of select="." />
        </mn>
    </xsl:template>

    <xsl:template match="дробь">
        <mfrac>
            <xsl:apply-templates select="строка[1]" />
            <xsl:apply-templates select="строка[2]" />
        </mfrac>
    </xsl:template>

    <xsl:template match="верх">
        <msup>
            <xsl:apply-templates select="строка[1]" />
            <xsl:apply-templates select="строка[2]" />
        </msup>
    </xsl:template>

    <xsl:template match="низ">
        <msub>
            <xsl:apply-templates select="строка[1]" />
            <xsl:apply-templates select="строка[2]" />
        </msub>
    </xsl:template>

    <xsl:template match="низверх">
        <msubsup>
            <xsl:apply-templates select="строка[1]" />
            <xsl:apply-templates select="строка[2]" />
            <xsl:apply-templates select="строка[3]" />
        </msubsup>
    </xsl:template>

    <xsl:template match="корень">
        <msqrt>
            <xsl:apply-templates />
        </msqrt>
    </xsl:template>

    <xsl:template match="строка">
        <mrow>
            <xsl:apply-templates select="*" />
        </mrow>
    </xsl:template>

</xsl:stylesheet>