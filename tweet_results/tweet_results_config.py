def feeds(league):
	if league == 'nba':
		uri = "http://www.totallyscored.com/rss/sport/2"
	elif league == 'mlb':
		uri = "http://www.totallyscored.com/rss/sport/4"  
	elif league == 'nhl':
		uri = "http://www.totallyscored.com/rss/sport/1"  
	return uri 
	
def accounts(league):
	accounts = dict()
	if league == 'nba':
		accounts['LEAGUE'] = 'nba_results'
		accounts['Boston'] = 'celtics_results'
		accounts['Cleveland'] = 'cavs_results'
		accounts['Detroit'] = 'pistons_results'
		accounts['L.A. Lakers'] = 'lakers_results'
		accounts['New Orleans'] = 'hornets_results'
		accounts['Orlando'] = 'magic_results'
		accounts['San Antonio'] = 'spurs_results'
		accounts['Utah'] = 'jazz_results'
	elif league == 'mlb':
		accounts['LEAGUE'] = 'mlb_results'
		accounts['Boston'] = 'redsox_results'
		accounts['Chicago Cubs'] = 'cubs_results'
		accounts['L.A. Dodgers'] = 'dodgers_results'
		accounts['N.Y. Yankees'] = 'yankees_results'
		accounts['Oakland'] = 'as_results'
		accounts['San Francisco'] = 'giants_results'
		accounts['Seattle'] = 'mariner_results'
		accounts['St. Louis'] = 'cards_results'
		accounts['Toronto'] = 'bluejay_results'

		# accounts['Cincinnati'] = '_results'
		# accounts['Tampa Bay'] = '_results'
		# accounts['San Diego'] = '_results'

		# accounts['Texas'] = '_results'
		# accounts['Minnesota'] = '_results'
		# accounts['Colorado'] = '_results'
		# accounts['Philadelphia'] = '_results'
		# accounts['Washington'] = '_results'
		# accounts['Houston'] = '_results'
		# accounts['Kansas City'] = '_results'
		# accounts['N.Y. Mets'] = '_results'
		# accounts['Chicago White Sox'] = '_results'
		# accounts['Detroit'] = '_results'
		# accounts['Arizona'] = '_results'
		# accounts['San Diego'] = '_results'
		# accounts['L.A. Angels'] = '_results'
		# accounts['Pittsburgh'] = '_results'
		# accounts['Milwaukee'] = '_results'
		# accounts['Atlanta'] = '_results'
		# accounts['Cleveland'] = '_results'
	elif league == 'nhl':
		accounts['LEAGUE'] = 'nhl_results'
		accounts['San Jose'] = 'sharks_results'
		accounts['Dallas'] = 'stars_results'
	return accounts
