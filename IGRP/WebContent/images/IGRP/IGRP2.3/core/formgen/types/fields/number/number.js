var NUMBERFIELD = function(type,params){
	Field.call(this,type,params);
}
this[VARS.name].declareField({
	type:'number',
	field:NUMBERFIELD
});