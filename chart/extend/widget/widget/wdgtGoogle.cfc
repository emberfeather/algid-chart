component extends="plugins.widget.inc.resource.base.widget" {
	public string function process( required string content, required struct args ) {
		local.reserved = ['id', 'class', 'cht'];
		
		if(!structKeyExists(arguments.args, 'id')) {
			arguments.args.id = 'googleChart' & randRange(1, 2500);
		}
		
		if(!structKeyExists(arguments.args, 'class')) {
			arguments.args.class = '';
		}
		
		if(!structKeyExists(arguments.args, 'cht')) {
			arguments.args.cht = 'lc';
		}
		
		local.src = '//chart.googleapis.com/chart?cht=' & arguments.args.cht;
		
		local.keys = listToArray(structKeyList(arguments.args));
		
		for( local.i = 1; local.i <= arrayLen(local.keys); local.i++ ) {
			if(!arrayFindNoCase(local.reserved, local.keys[local.i])) {
				local.src &= '&amp;' & lcase(local.keys[local.i]) & '=' & arguments.args[local.keys[local.i]];
			}
		}
		
		local.src &= '&amp;chd=' & trim(arguments.content);
		
		return '<img src="' & local.src & '" id="' & arguments.args.id & '" class="' & arguments.args.class & '" />';
	}
}
