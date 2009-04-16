var ls = {};
ls.currentTeamReplace = '';

$(document).ready(function() {
				  $('#showteams').hide();	
				  $('#scores').hide();	
				  ls.addEventHandlers();
				  });

ls.addEventHandlers = function(){
	$('#showteams a').click(function(ev){
							ev.preventDefault();
							$('#showteams').hide();
							$('#teams').show();
							$('#scores').hide();
							return false;
							})
	$('#teams .teamname a').click(function(ev){
								  ev.preventDefault();
								  $('#notice').append('Loading...');
								  $('#scores').empty();
								  $('#showteams').show();	
								  $('#scores').show();
								  $('#teams').hide();
								  ls.currentTeamReplace = $(ev.target).attr('remove');
								  if(window.Components && window.netscape && window.netscape.security && document.location.protocol.indexOf("http") == -1)
								  window.netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
								  $.get($(ev.target).attr('href'), ls.displayScores);
								  return false;
								  });
}

ls.displayScores = function(ev){
	
	$(ev).find('item').each(function(){
							var $item = $(this);
							var $title = $item.find('title').text();
							var entry = "<div class='entry'>" + $title.replace(ls.currentTeamReplace, '') + "</div>";
							$('#scores').append(entry);
							});
	$('#notice').empty();
}
