<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- STATBOX CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/statbox/statbox.css"/>
                <!-- CHART CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
                <style/>
                <style>
                    .crm-container .statbox{
                        height: 230px;
                        padding:0;
                    }
                    .crm-container .statbox .title{
                        position: relative;
                        top: 0;
                        right: 0;
                        padding: 10px;
                        font-size: 25px;
                        display: block;
                    }
                    .crm-container .statbox.cp-emerald{
                        background: #01d533 !important;
                    }
                    .crm-container .statbox.cp-emerald .title{
                        background: #00b029;
                    }
                    .crm-container .statbox.cp-cyan{
                        background: #57c3f4 !important;
                    }
                    .crm-container .statbox.cp-cyan .title{
                        background: #4aa3cd;
                    }
                    .crm-container .statbox.cp-yellow{
                        background: #f7d639 !important;
                    }
                    .crm-container .statbox.cp-yellow .title{
                        background: #cbb32f;
                    }
                    .crm-container .statbox .number{
                        position: relative;
                        padding: 10px;
                        top: 0;
                        right: 0;
                        font-size: 25px;
                    }
                </style>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-4">
                                            <div class="box">
                                                    <xsl:if test="rows/content/statbox_2">
                                                        <div class="statbox_container crm-container" gen-class="" item-name="statbox_2">
                                                            <div class="statbox {rows/content/statbox_2/fields/statbox_2_bg/value}" style="margin-bottom:0;">
                                                                <div class="title">
                                                                    <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_tit/value"/>
                                                                </div>
                                                                <div class="number">
                                                                    <xsl:value-of select="rows/content/statbox_2/fields/statbox_2_val/value"/>
                                                                    <i class="fa {rows/content/statbox_2/fields/statbox_2_icn/value}" aria-hidden="true"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                                    <xsl:if test="rows/content/statbox_3">
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="statbox_container gen-container-item crm-container" gen-class="" item-name="statbox_3">
                                                                <div class="statbox {rows/content/statbox_3/fields/statbox_3_bg/value}">
                                                                    <div class="title">
                                                                        <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_tit/value"/>
                                                                    </div>
                                                                    <div class="number">
                                                                        <xsl:value-of select="rows/content/statbox_3/fields/statbox_3_val/value"/>
                                                                        <i class="fa {rows/content/statbox_3/fields/statbox_3_icn/value}" aria-hidden="true"/>
                                                                    </div>
                                                                </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                                    <xsl:if test="rows/content/statbox_1">
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="statbox_container gen-container-item crm-container" gen-class="" item-name="statbox_1">
                                                                    <div class="statbox {rows/content/statbox_1/fields/statbox_1_bg/value}">
                                                                        <div class="title">
                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_tit/value"/>
                                                                        </div>
                                                                        <div class="number">
                                                                            <xsl:value-of select="rows/content/statbox_1/fields/statbox_1_val/value"/>
                                                                            <i class="fa {rows/content/statbox_1/fields/statbox_1_icn/value}" aria-hidden="true"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-md-8">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/chart_2">
                                                    <div class="box gen-container-item " gen-structure="graphic" gen-class="" item-name="chart_2">
                                                        <div class="box-body">
                                                            <xsl:call-template name="igrp-graph">
                                                                <xsl:with-param name="table" select="rows/content/chart_2"/>
                                                                <xsl:with-param name="chart_type" select="rows/content/chart_2/chart_type"/>
                                                                <xsl:with-param name="height" select="'400'"/>
                                                                <xsl:with-param name="title" select="'Vendas por Número de Oportunidade'"/>
                                                                <xsl:with-param name="url" select="rows/content/chart_2/url"/>
                                                            </xsl:call-template>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- CHART JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js"/>
                <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489145295384"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489145295384"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489145295384"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489145295384"/>
    <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1489145295386"/>
</xsl:stylesheet>