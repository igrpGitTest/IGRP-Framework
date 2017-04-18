<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/igrp.tables.css"/>
        <link media="all" type="text/css" href="{$path}/extensions/table.styles/buttonlist/btnlist.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/containers/table/includes/table-colors.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/css/bootstrap-colorpicker.min.css"/>
      </head>
      <body class="{$bodyClass} old-v">
        <xsl:call-template name="IGRP-topmenu"/>
        <form method="POST" class="IGRP-form">
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <section class="content-header gen-container-item">
                    <h1>
                      <xsl:value-of select="rows/content/title"/>
                    </h1>
                  </section>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                        <xsl:if test="rows/content/form/label/logout">
                          <div class="form-group col-md-3" item-name="logout" item-type="link">
                            <a href="{rows/content/form/value/logout}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/logout"/>
                            </a>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/lista_favoritos">
                          <div class="table-btn-list self-boxed-item">
                            <div class="self-boxed-inner" list-style="buttonlist">
                              <xsl:for-each select="rows/content/form/table/lista_favoritos/value/row">
                                <div class="btn-list-item col-sm-6 col-md-3">
                                  <div class="card">
                                    <a href="{link_favorito}" class="card-container" target="_blank" style="background: {cor};">
                                      <div class="card-icon">
                                        <i class="fa fa-{icon}"/>
                                      </div>
                                      <span class="card-text txt-ellipsis">
                                        <xsl:value-of select="link_favorito_desc"/>
                                      </span>
                                    </a>
                                  </div>
                                </div>
                              </xsl:for-each>
                            </div>
                          </div>
                        </xsl:if>
                        <xsl:if test="rows/content/form/label/lista_servicos">
                          <div class="box box-table-contents gen-item-boxed gen-container-item" item-name="lista_servicos">
                            <div class="box-header">
                              <h3 class="box-title">
                                <xsl:value-of select="rows/content/form/label/lista_servicos"/>
                              </h3>
                            </div>
                            <div class="box-body table-box">
                              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value">
                                <xsl:with-param name="rel" select="'lista_servicos'"/>
                              </xsl:apply-templates>
                              <table id="lista_servicos" class="table table-striped gen-data-table  ">
                                <thead>
                                  <tr>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/menu">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/menu/@visible)">
                                        <th item-name="menu" item-type="text">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/menu"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/desc_servico">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/desc_servico/@visible)">
                                        <th item-name="desc_servico" item-type="icon">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/desc_servico"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="rows/content/form/table/lista_servicos/label/link_servico">
                                      <xsl:if test="not(rows/content/form/table/lista_servicos/label/link_servico/@visible)">
                                        <th item-name="link_servico" item-type="link">
                                          <xsl:value-of select="rows/content/form/table/lista_servicos/label/link_servico"/>
                                        </th>
                                      </xsl:if>
                                    </xsl:if>
                                  </tr>
                                </thead>
                                <tbody>
                                  <xsl:for-each select="rows/content/form/table/lista_servicos/value/row[not(@total='yes')]">
                                    <tr>
                                      <xsl:apply-templates mode="context-param" select="context-menu"/>
                                      <xsl:if test="menu">
                                        <xsl:if test="not(menu/@visible)">
                                          <td item-name="menu" item-type="text" data-row="{position()}" data-title="{../../label/menu}">
                                            <span>
                                              <xsl:value-of select="menu"/>
                                            </span>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="menu/@visible = 'false'">
                                          <input type="hidden" name="p_menu_fk" value="menu"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="desc_servico">
                                        <xsl:if test="not(desc_servico/@visible)">
                                          <td item-name="desc_servico" item-type="icon" data-row="{position()}" data-title="{../../label/desc_servico}">
                                            <span>
                                              <xsl:value-of select="desc_servico"/>
                                            </span>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="desc_servico/@visible = 'false'">
                                          <input type="hidden" name="p_desc_servico_fk" value="desc_servico"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <xsl:if test="link_servico">
                                        <xsl:if test="not(link_servico/@visible)">
                                          <td item-name="link_servico" item-type="link" data-row="{position()}" data-title="{../../label/link_servico}">
                                            <xsl:choose>
                                              <xsl:when test="link_servico != ''">
                                                <a href="{link_servico}" class="link bClick" name="link_servico" target="_blank">
                                                  <xsl:value-of select="link_servico_desc" disable-output-escaping="yes"/>
                                                </a>
                                              </xsl:when>
                                              <xsl:otherwise>
                                                <span>
                                                  <xsl:value-of select="link_servico_desc" disable-output-escaping="yes"/>
                                                </span>
                                              </xsl:otherwise>
                                            </xsl:choose>
                                          </td>
                                        </xsl:if>
                                        <xsl:if test="link_servico/@visible = 'false'">
                                          <input type="hidden" name="p_link_servico_fk" value="link_servico"/>
                                        </xsl:if>
                                      </xsl:if>
                                      <input type="hidden" name="p_lista_servicos_id" value="{lista_servicos_id}"/>
                                      <input type="hidden" name="p_id_servico_fk" value="{id_servico}"/>
                                      <input type="hidden" name="p_id_servico_fk_desc" value="{id_servico_desc}"/>
                                      <input type="hidden" name="p_tipo_menu_fk" value="{tipo_menu}"/>
                                      <input type="hidden" name="p_tipo_menu_fk_desc" value="{tipo_menu_desc}"/>
                                      <input type="hidden" name="p_data_inicio_servico_fk" value="{data_inicio_servico}"/>
                                      <input type="hidden" name="p_data_inicio_servico_fk_desc" value="{data_inicio_servico_desc}"/>
                                      <input type="hidden" name="p_data_fim_servico_fk" value="{data_fim_servico}"/>
                                      <input type="hidden" name="p_data_fim_servico_fk_desc" value="{data_fim_servico_desc}"/>
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
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
                        <xsl:if test="rows/content/filter/label/pesquisa">
                          <div class="form-group col-md-3" item-name="pesquisa" item-type="text">
                            <label for="{rows/content/filter/label/pesquisa/@name}">
                              <xsl:value-of select="rows/content/filter/label/pesquisa"/>
                            </label>
                            <input type="text" value="{rows/content/filter/value/pesquisa}" class="form-control" id="{rows/content/filter/label/pesquisa/@name}" name="{rows/content/filter/label/pesquisa/@name}"/>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                    <xsl:apply-templates select="rows/content/filter/tools-bar" mode="form-buttons">
                      <xsl:with-param name="use-fa" select="'false'"/>
                    </xsl:apply-templates>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/containers/form/includes/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker/js/bootstrap-colorpicker.js"/>
        <script type="text/javascript" src="{$path}/extensions/formgen/types/fields/color/includes/colorpicker.init.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
