component extends="plugins.widget.inc.resource.base.widget" {
	public string function process( required string content, required struct args ) {
		if(!structKeyExists(arguments.args, 'id')) {
			arguments.args.id = 'flot' & randRange(1, 2500);
		}
		
		if(!structKeyExists(arguments.args, 'class')) {
			arguments.args.class = '';
		}
		
		if(!structKeyExists(arguments.args, 'options')) {
			arguments.args.options = {};
		}
		
		addScript(variables.transport.theRequest.webRoot & 'plugins/chart/script/flot/jquery.flot-min.js');
		addScript('require([ 'jquery' ], function(jQuery) {(function($){ $(function() { $.plot($(''##' & arguments.args.id & '''), ' & arguments.content & ', ' & serializeJson(arguments.args.options) & ') }); }(jQuery));});');
		
		return '<div id="' & arguments.args.id & '" class="' & arguments.args.class & '"></div>';
	}
}
