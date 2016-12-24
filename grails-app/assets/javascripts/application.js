// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require_tree .
//= require_self
//= require jquery-1.10.2
//= require materialize.min

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function timeSince(date) {

    var seconds = Math.floor((new Date() - date) / 1000);

    var interval = Math.floor(seconds / 31536000);

    if (interval > 1) {
        return interval + " years";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval > 1) {
        return interval + " months";
    }
    interval = Math.floor(seconds / 86400);
    if (interval > 1) {
        return interval + " days";
    }
    interval = Math.floor(seconds / 3600);
    if (interval > 1) {
        return interval + " hours";
    }
    interval = Math.floor(seconds / 60);
    if (interval > 1) {
        return interval + " minutes";
    }
    return Math.floor(seconds) + " seconds";
}

$(function(){

    $("#changePP").hide();
    $("#profilePicture").on('click', function(){

        $("#changePP").show();
    });
    $("#cancelPP").on('click', function(){

        $("#changePP").hide();
    });
});
$(function(){

    for(var i = 0; $("#opinionDate" + i).val(); i++){
        $("#time-since" + i).html(timeSince(new Date($("#opinionDate" + i).val())) + " ago");
    }

    var element = $(".opinion-card .opinion-comment .comment .text");
    element.children().each(function(index){
        var iplus = $(this).text().indexOf('+');
        var opinion = $(this).text();
        var i;
        if(iplus != -1){

            for(i = opinion.indexOf('+') + 1; i < opinion.length && opinion[i] != ' '; i++){

                var c = opinion[i];
                if(c < 97 || c > 122)
                    break;
            }
            var tag = opinion.substring(opinion.indexOf('+') + 1, i);
            var addition = opinion.substring(0, opinion.indexOf('+')) + '<a href = "/Toit/opinion/opinions/+' + tag + '">+' + tag + '</a>' + opinion.substring(i, opinion.length);
            $(this).html(addition);
        }
        var iminus = $(this).text().indexOf('-');
        if(iminus != -1){

            for(i = opinion.indexOf('-') + 1; i < opinion.length && opinion[i] != ' '; i++){

                var c = opinion[i];
                if(c < 97 || c > 122)
                    break;
            }
            var tag = opinion.substring(opinion.indexOf('-') + 1, i);
            var addition = opinion.substring(0, opinion.indexOf('-')) + '<a href = "/Toit/opinion/opinions/-' + tag + '">-' + tag + '</a>' + opinion.substring(i, opinion.length);
            $(this).html(addition);
        }
    });
});