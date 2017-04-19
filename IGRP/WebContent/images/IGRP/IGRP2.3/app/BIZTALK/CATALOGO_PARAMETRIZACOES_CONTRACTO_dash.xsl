<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/CATALOGO_PARAMETRIZACOES_CONTRACTO_dash.xml" -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
        <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>

         <body>

          <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>

        <!--CENTER PANE-->
        <div class="general">
        <div id="content">


         <!--HOME SIDE
        <xsl:call-template name="home-side"/> -->

        <div class="ui-layout-center">

        <xsl:call-template name="dialog-modal"/>
        <!-- END HOME TOP -->

        <!-- START YOUR CODE HERE -->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>

        
        <!--START PAGE-->


     </div>


        <!-- END YOUR CODE HERE -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM -->
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201311272"/>

<xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=201311272"/>

</xsl:stylesheet>