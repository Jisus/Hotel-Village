// toggles
function initToggles() {
	var s = $$('.stretcher');
	for (var i=0; i<s.length; i++) {
		s[i].style.visibility = "visible";
	}
	
	var a = new Accordion('.toggler', '.stretcher', {
		show: -1
		,alwaysHide: true
		,opacity: false
		,onActive: function(toggler, element){
			toggler.addClass('open');
			}
		,onBackground: function(toggler, element){
			toggler.removeClass('open');
			}	
	});
}
window.addEvent('domready', initToggles);