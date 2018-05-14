<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="http://www.appian.com/ae/types/2009" version="1.0" exclude-result-prefixes="a">
   <xsl:template match="/">
      <testsuites>
         <xsl:attribute name="name">
            <xsl:value-of select="/a:TestRunResult/a:type" />
         </xsl:attribute>
         <xsl:attribute name="failures">
            <xsl:value-of select="/a:TestRunResult/a:failureCount" />
         </xsl:attribute>
         <xsl:attribute name="errors">
            <xsl:value-of select="/a:TestRunResult/a:errorCount" />
         </xsl:attribute>
         <xsl:attribute name="tests">
            <xsl:value-of select="/a:TestRunResult/a:testCount" />
         </xsl:attribute>
         <xsl:attribute name="time">
            <xsl:value-of select="/a:TestRunResult/a:totalElapsedTime" />
         </xsl:attribute>
         <xsl:apply-templates />
      </testsuites>
   </xsl:template>
   <xsl:template match="a:type" />
   <xsl:template match="a:failureCount" />
   <xsl:template match="a:errorCount" />
   <xsl:template match="a:name" />
   <xsl:template match="a:testCount" />
   <xsl:template match="a:totalExecutionTime" />
   <xsl:template match="a:totalElapsedTime" />
   <xsl:template match="a:passCount" />
   <xsl:template match="a:id" />
   <xsl:template match="a:executedBy" />
   <xsl:template match="a:queueTime" />
   <xsl:template match="a:startTime" />
   <xsl:template match="a:endTime" />
   <xsl:template match="a:status" />
   <xsl:template match="a:applicationTestResults">
      <testsuite>
         <xsl:attribute name="name">
            <xsl:value-of select="a:name" />
         </xsl:attribute>
         <xsl:attribute name="tests">
            <xsl:value-of select="a:testCount" />
         </xsl:attribute>
         <xsl:attribute name="errors">
            <xsl:value-of select="a:errorCount" />
         </xsl:attribute>
         <xsl:attribute name="failures">
            <xsl:value-of select="a:failureCount" />
         </xsl:attribute>
         <xsl:attribute name="time">
            <xsl:value-of select="a:totalExecutionTime" />
         </xsl:attribute>
         <xsl:choose>
            <xsl:when test="a:errorMessage!=''">
               <system-err>
                  <xsl:value-of select="a:errorMessage" />
               </system-err>
            </xsl:when>
            <xsl:otherwise>
               <xsl:for-each select="a:problemObjectsTestResult">
                  <xsl:for-each select="a:testCasesResult">
                     <xsl:if test="a:name!=''">
                        <testcase>
                           <xsl:attribute name="classname">
                              <xsl:value-of select="../a:name" />
                           </xsl:attribute>
                           <xsl:choose>
                              <xsl:when test="a:name!=''">
                                 <xsl:attribute name="name">
                                    <xsl:value-of select="a:name" />
                                 </xsl:attribute>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:attribute name="name">NO_NAME</xsl:attribute>
                              </xsl:otherwise>
                           </xsl:choose>
                           <xsl:attribute name="time">
                              <xsl:value-of select="a:executionTime" />
                           </xsl:attribute>
                           <xsl:attribute name="status">
                              <xsl:value-of select="a:status" />
                           </xsl:attribute>
                           <xsl:choose>
                              <xsl:when test="a:status='ERROR' or a:status='TIMEOUT'">
                                 <error>
                                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                    <xsl:value-of select="a:errorMessage" />
                                    <xsl:text />
                                    <xsl:text>&#xa;</xsl:text>
                                    <xsl:text>Expression Rule:</xsl:text>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="../a:url" />
                                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                                 </error>
                              </xsl:when>
                              <xsl:when test="a:status='FAIL'">
                                 <failure>
                                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                    <xsl:value-of select="a:failureMessage" />
                                    <xsl:text />
                                    <xsl:text>&#xa;</xsl:text>
                                    <xsl:text>Expression Rule:</xsl:text>
                                    <xsl:text />
                                    <xsl:value-of select="../a:url" />
                                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                                 </failure>
                              </xsl:when>
                           </xsl:choose>
                        </testcase>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:for-each>
               <xsl:for-each select="a:passObjectsTestResult">
                  <xsl:for-each select="a:testCasesResult">
                     <xsl:if test="a:name!=''">
                        <testcase>
                           <xsl:attribute name="classname">
                              <xsl:value-of select="../a:name" />
                           </xsl:attribute>
                           <xsl:choose>
                              <xsl:when test="a:name!=''">
                                 <xsl:attribute name="name">
                                    <xsl:value-of select="a:name" />
                                 </xsl:attribute>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:attribute name="name">NO_NAME</xsl:attribute>
                              </xsl:otherwise>
                           </xsl:choose>
                           <xsl:attribute name="time">
                              <xsl:value-of select="a:executionTime" />
                           </xsl:attribute>
                           <xsl:attribute name="status">
                              <xsl:value-of select="a:status" />
                           </xsl:attribute>
                        </testcase>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:otherwise>
         </xsl:choose>
      </testsuite>
   </xsl:template>
</xsl:stylesheet>
