<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <style/>
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
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/pesquisa_organica_rh">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="pesquisa_organica_rh" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/pesquisa_organica_rh/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/pesquisa_organica_rh/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/pesquisa_organica_rh/value}" class="form-control gen-lookup " id="form_1_pesquisa_organica_rh" name="{rows/content/form_1/fields/pesquisa_organica_rh/@name}" maxlength="100"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/pesquisa_organica_rh/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/pesquisa_organica_rh/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_pesquisa_organica_rh'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/utilizador">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/utilizador/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/perfil">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/perfil/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/organica_igrp">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/organica_igrp/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/organica_rh">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/organica_rh/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="utilizador">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/utilizador/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="perfil">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/perfil/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="perfil"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="organica_igrp">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/organica_igrp/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="organica_igrp"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="organica_rh">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/organica_rh/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="organica_rh"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
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
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491917139831"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491917139831"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491917139831"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491917139831"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491917139831"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491917139831"/>
</xsl:stylesheet>