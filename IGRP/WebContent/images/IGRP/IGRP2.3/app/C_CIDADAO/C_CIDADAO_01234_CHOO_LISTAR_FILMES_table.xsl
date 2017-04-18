<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html><!--XSL Generator (RED/DIM 2015)--><head><!--HOME-HEADER--><xsl:call-template name="home-header"/>
      </head>
      <body class="bodyColor">
        <div class="IGRP_overlay"/><!--HOME TOP--><xsl:call-template name="home-top-main"/><!--HOME--><div id="igrp-bodyPage"><!--HOME LEFT--><xsl:if test="not(rows/target) or rows/target!='_blank'"><!--MENU--><div class="bodyPageLeft">
              <xsl:apply-templates mode="slide-menu" select="document(rows/slide-menu/@file)"/>
            </div>
          </xsl:if><!--HOME RIGTH--><div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE --><div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div><!-- SHOW NOTIFICATION MESSAGES--><xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!-- SHOW HIDDEN--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/><!-- START FILTER--><div class="box-content resetPadding">
                <div class="col">
                  <xsl:if test="rows/content/form/label/filtro_nome">
                    <div class="col-1-4 item" item-name="filtro_nome">
                      <div class="igrp_item text">
                        <label>
                          <xsl:value-of select="rows/content/form/label/filtro_nome" disable-output-escaping="yes"/>
                        </label>
                        <input type="text" name="{rows/content/form/value/filtro_nome/@name}" value="{rows/content/form/value/filtro_nome}" class="text" maxlength="50">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/filtro_nome"/>
                          </xsl:call-template>
                        </input>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/filtro_categoria">
                    <div class="col-1-4 item" item-name="filtro_categoria">
                      <div class="igrp_item select">
                        <label>
                          <xsl:value-of select="rows/content/form/label/filtro_categoria" disable-output-escaping="yes"/>
                        </label>
                        <select name="{rows/content/form/list/filtro_categoria/@name}" chosen="select" data-placeholder="{rows/content/form/list/filtro_categoria/option[position() = 1]}" class="select">
                          <xsl:call-template name="FIELD_validator">
                            <xsl:with-param name="field" select="rows/content/form/label/filtro_categoria"/>
                          </xsl:call-template>
                          <option value=""/>
                          <xsl:for-each select="rows/content/form/list/filtro_categoria/option[position() != 1]">
                            <option value="{value}">
                              <xsl:if test="@selected='true'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="text"/>
                            </option>
                          </xsl:for-each>
                        </select>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/filtro_data_min">
                    <div class="col-1-4 item" item-name="filtro_data_min">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/form/label/filtro_data_min" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/filtro_data_min/@name}" value="{rows/content/form/value/filtro_data_min}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/filtro_data_min"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/filtro_data_max">
                    <div class="col-1-4 item" item-name="filtro_data_max">
                      <div class="igrp_item date">
                        <label>
                          <xsl:value-of select="rows/content/form/label/filtro_data_max" disable-output-escaping="yes"/>
                        </label>
                        <div class="itemIcon">
                          <input type="text" name="{rows/content/form/value/filtro_data_max/@name}" value="{rows/content/form/value/filtro_data_max}" class="date" trel="IGRP_datePicker">
                            <xsl:call-template name="FIELD_validator">
                              <xsl:with-param name="field" select="rows/content/form/label/filtro_data_max"/>
                            </xsl:call-template>
                          </input>
                          <div class="calendar"/>
                        </div>
                        <div class="_clear"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                  </xsl:if>
                  <div class="_clear"/>
                </div><!--START TOOL BAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/><!--END TOOL BAR FILTER--></div><!-- END FILTER--><!-- START TABELA--><div class="box-content resetPadding"><!--START TOOL BAR TABLE--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
                  <xsl:with-param name="isTable" select="'true'"/>
                  <xsl:with-param name="rel" select="table"/>
                </xsl:apply-templates><!--END TOOL BAR TABLE--><div class="box-table table-responsive">
                  <div class="table-container"><!--  CONTEXT-MENU  --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                      <xsl:with-param name="contextId" select="'table'"/>
                    </xsl:apply-templates>
                    <table class="IGRP_table default-table" data-control="table">
                      <thead>
                        <tr>
                          <xsl:if test="rows/content/table/label/lista_nome">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lista_nome"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/lista_categoria">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lista_categoria"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/lista_data_public">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lista_data_public"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/lista_copias">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lista_copias"/>
                            </th>
                          </xsl:if>
                          <xsl:if test="rows/content/table/label/lista_descricao">
                            <th align="">
                              <xsl:value-of select="rows/content/table/label/lista_descricao"/>
                            </th>
                          </xsl:if>
                        </tr>
                      </thead>
                      <tbody>
                        <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                          <tr row="{position()}" class="IGRP_contextMenu">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <xsl:if test="lista_nome">
                              <td align="" data-row="{position()}" data-title="{../../label/lista_nome}">
                                <xsl:value-of select="lista_nome"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="lista_categoria">
                              <td align="" data-row="{position()}" data-title="{../../label/lista_categoria}">
                                <xsl:value-of select="lista_categoria"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="lista_data_public">
                              <td align="" data-row="{position()}" data-title="{../../label/lista_data_public}">
                                <xsl:value-of select="lista_data_public"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="lista_copias">
                              <td align="" data-row="{position()}" data-title="{../../label/lista_copias}">
                                <xsl:value-of select="lista_copias"/>
                              </td>
                            </xsl:if>
                            <xsl:if test="lista_descricao">
                              <td align="" data-row="{position()}" data-title="{../../label/lista_descricao}">
                                <xsl:value-of select="lista_descricao"/>
                              </td>
                            </xsl:if>
                          </tr>
                        </xsl:for-each>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div><!-- END TABELA--></form><!-- END YOUR CODE HERE --><div class="_clear"/>
          </div>
          <div class="_clear"/>
        </div><!--FOOTER PAGE--><div id="igrp-footerPage">
          <xsl:call-template name="footer"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150306"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150306"/>
</xsl:stylesheet>
