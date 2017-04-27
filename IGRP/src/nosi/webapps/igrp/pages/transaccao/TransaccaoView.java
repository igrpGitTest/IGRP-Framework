/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TransaccaoView extends View {		
	
	public Field sectionheader_1_text;
	public Field codigo;
	public Field aplicacao;
	public Field organica;
	public Field descricao;
	public Field estado;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_pesquisar;
	public TransaccaoView(Transaccao model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gest�o de Transac��es");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("C�digo");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplica��o");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Org�nica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descri��o");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		estado = new TextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","_blank","default|fa-search","default||fa-search|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_pesquisar.propertie.add("type","specific").add("code","").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(codigo);
		form_1.addField(aplicacao);
		form_1.addField(organica);


		table_1.addField(codigo);
		table_1.addField(descricao);
		table_1.addField(estado);

		toolsbar_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/