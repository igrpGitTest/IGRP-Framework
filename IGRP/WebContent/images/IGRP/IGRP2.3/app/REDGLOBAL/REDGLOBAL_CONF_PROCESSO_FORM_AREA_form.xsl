<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                                                    <div class="col-md-12 form-group pull-right gen-fields-holder" item-name="env_fk" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/env_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/env_fk/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sep_area">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/sep_area/label"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/code">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="code" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/code/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/code/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/code/value}" class="form-control " id="{rows/content/form_1/fields/code/@name}" name="{rows/content/form_1/fields/code/@name}" readonly="readonly" required="required" maxlength="20" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/name">
                                                                    <div class="form-group col-md-6 pull-right  gen-fields-holder" item-name="name" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/name/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/name/value}" class="form-control " id="{rows/content/form_1/fields/name/@name}" name="{rows/content/form_1/fields/name/@name}" required="required" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/description">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="description" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/description/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/description/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/description/@name}" class="textarea form-control " maxlength="4000">
                                                                            <xsl:value-of select="rows/content/form_1/fields/description/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/status">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="status" item-type="checkbox">
                                                                        <div class="form-group">
                                                                            <div class="checkbox form-check-offset">
                                                                                <label>
                                                                                    <input type="checkbox" name="{rows/content/form_1/fields/status/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/status/label}">
                                                                                        <xsl:if test="rows/content/form_1/fields/status/value = '1'">
                                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                        </xsl:if>
                                                                                    </input>
                                                                                    <span>
                                                                                        <xsl:value-of select="rows/content/form_1/fields/status/label"/>
                                                                                    </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490718327490"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490718327490"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490718327490"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490718327490"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490718327490"/>
</xsl:stylesheet>