require 'net/http'
require 'uri'

def getNotices feed
  notices = Array.new
  
  url = URI.parse(feed)
  res = Net::HTTP.get(url)
  res.gsub('/class="commgoal">','')
  
  myArray = res.scan(/class="commGoal">[0-9+A-Za-z: \t\n\r\f<\/>-]*div>/)
  #puts myArray
  myArray.reverse_each {|elt|
    #puts elt
    score = elt.gsub('class="commGoal">', '')
    #puts score
    score = score.gsub('<b>', '')
    #puts score
    score = score.gsub('<br />', ' - ')
    #puts score
    score = score.gsub('</b><', '')
    score = score.gsub('/div>','')
    #puts score
    notices.insert(notices.size, score)
  }
  #puts notices
  myArray = res.scan(/Final Result/)
  
  if myArray.size == 1
          myArray = res.scan(/class="sh">[0-9A-Za-z: ()\t\n\r\f-]*<\/div/)
          final_score = myArray[0].gsub('class="sh">', '')
          final_score = final_score.gsub('</div','')
          myArray = final_score.scan(/[0-9A-Za-z \f-][0-9A-Za-z \f-]*/)
          notices.insert(notices.size, 'Final score: ' + myArray[0])
  end
  #puts "######## all notices #######"
  #puts notices
  #puts "######## all notices #######"
  #get tweats
  return notices
end

def getTweets twitter_username

  #url = URI.parse('http://twitter.com/statuses/user_timeline/' + twitter_username + '.xml')
  #url.user = twitter_username
  #url.password = twitter_password
  
  url = URI.parse('http://twitter.com/' + twitter_username)
  res = Net::HTTP.get(url)
  
  tweats = Array.new
  
  all_tweats = res.scan(/<span class="entry-content">[0-9+A-Za-z: \t\n\r\f<\/>-]*<\/span>/)
  all_tweats.each {|elt|
      tweat = elt.gsub('<span class="entry-content">', '')
      tweat = tweat.gsub('</span>', '')
      tweats.insert(0, tweat)
  }
  
  #puts all_tweats
  return tweats

end 

def compareAndPost all_tweats, notices, twitter_username, twitter_password, force

  to_post = Array.new
  
  if all_tweats.size > 0 || force == "true"
  
      notices.each {|elt|
          #puts elt
          found = false
          tweats.each {|tweat|
              #puts "######comparing tweats######"
              #puts elt
              #puts tweat
              #puts "######comparing tweats######"
              if elt.include? tweat
                  found = true
                  break
              end
          }
          if !found
	      #puts elt
              to_post.insert(0, elt)
          end
      }
      if to_post.size > 0
        puts to_post
      else
        puts "No updates"
      end
      to_post.reverse_each {|status|
          url = URI.parse('http://twitter.com/statuses/update.xml')
          url.user = twitter_username
          url.password = twitter_password
#res = Net::HTTP.post_form(url, {'status' => status})
          #puts res
      }
  end

  return to_post

end

def postToTwitter twitter_username, twitter_password, feed, league, force = false
  
  puts "##### NEW TEAM: " + twitter_username + " #####"
  
  notices = getNotices(feed)
  all_tweats = getTweets(twitter_username)
  to_post = compareAndPost(all_tweats, notices, twitter_username, twitter_password, force)

  if league == 'premier'
	all_tweats = getTweets('prem_scores')
        compareAndPost(all_tweats, notices, 'prem_scores', twitter_password, force)
  end

end

class Team
  attr_accessor :feed, :username, :password, :league
  
  def initialize (feed, username, password, league)
    @feed = feed
    @username = username
    @password = password 
    @league = league
  end
end

teams = Array.new
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/a/arsenal/live_text/default.stm', 'arsenal_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/a/aston_villa/live_text/default.stm', 'villa_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/b/blackburn_rovers/live_text/default.stm', 'blackburn_score', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/b/birmingham_city/live_text/default.stm', 'brum_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/b/bolton_wanderers/live_text/default.stm', 'bolton_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/b/burnley/live_text/default.stm', 'burnley_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/c/chelsea/live_text/default.stm', 'chelsea_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/e/everton/live_text/default.stm', 'everton_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/f/fulham/live_text/default.stm', 'fulham_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/h/hull_city/live_text/default.stm', 'hull_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/l/liverpool/live_text/default.stm', 'liverpool_score', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/m/man_city/live_text/default.stm', 'mancity_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/m/man_utd/live_text/default.stm', 'manutd_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/p/portsmouth/live_text/default.stm', 'pompy_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/s/stoke_city/live_text/default.stm', 'stoke_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/s/sunderland/live_text/default.stm', 'sunderlandscore', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/t/tottenham_hotspur/live_text/default.stm', 'spurs_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/w/west_ham_utd/live_text/default.stm', 'westham_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/w/wigan_athletic/live_text/default.stm', 'wigan_scores', '', 'premier'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/w/wolverhampton_wanderers/live_text/default.stm', 'wolves_scores', '', 'premier'))

teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/c/cardiff_city/live_text/default.stm', 'cardiff_scores', '', 'championship'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/c/crystal_palace/live_text/default.stm', 'palace_scores', '', 'championship'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/i/ipswich_town/live_text/default.stm', 'ipswich_scores', '', 'championship'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/m/middlesbrough/live_text/default.stm', 'boro_scores', '', 'championship'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/n/newcastle_united/live_text/default.stm', 'newcastle_score', '', 'championship'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/s/sheff_utd/live_text/default.stm', 'sheffutd_scores', '', 'championship'))

teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/c/charlton_athletic/live_text/default.stm', 'charlton_scores', '', 'leagueone'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/l/leeds_united/live_text/default.stm', 'leedsutd_scores', '', 'leagueone'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/s/southampton/live_text/default.stm', 'southampton', '', 'leagueone'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/s/swindon_town/live_text/default.stm', 'swindon_scores', '', 'leagueone'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/t/tranmere_rovers/live_text/default.stm', 'tranmere_scores', '', 'leagueone'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/y/yeovil/live_text/default.stm', 'yeovil_scores', '', 'leagueone'))

teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/g/gravesend_and_northfleet/live_text/default.stm', 'ebbsfleet_score', '', 'nonleague'))
teams.insert(teams.size, Team.new('http://news.bbc.co.uk/sport2/hi/football/teams/y/york_city/live_text/default.stm', 'york_scores', '', 'nonleague'))

teams.each {|team|
  begin
    postToTwitter team.username, team.password, team.feed, team.league
  rescue
    puts "oh dear" + $! 
   end
}
