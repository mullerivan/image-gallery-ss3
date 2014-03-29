/* Enquiry reveal on product pages */
function showEnquiry() {
	document.getElementById("enquiry").style.display = '';
	window.location.hash="enquire"; 
}

$(function() {
    var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
    if (document.getElementById("bookmarkme") != null) {
        document.getElementById("bookmarkme").click(function() {
            if (window.sidebar && window.sidebar.addPanel) { // Mozilla Firefox Bookmark
                window.sidebar.addPanel(document.title,window.location.href,'');
            } else if(window.external && ('AddFavorite' in window.external)) { // IE Favorite
                window.external.AddFavorite(location.href,document.title);
            } else if(window.opera && window.print) { // Opera Hotlist
                this.title=document.title;
                return true;
            } else if (is_chrome){ // webkit - safari/chrome
                alert('Press ' + (navigator.userAgent.toLowerCase().indexOf('mac') != - 1 ? 'Command/Cmd' : 'CTRL') + ' + D to bookmark this page.');
            }

        });



    }

});