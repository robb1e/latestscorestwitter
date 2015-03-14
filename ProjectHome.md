# About this project #
This project is a small, but useful one.  It has two components.
  * Football (soccer) score updates.
  * Twitter Results - NBA/MLB/NHL updates

Follow this project on Twitter.com/latest\_scores


---



## Football (soccer) score updates ##
Using the data gathered from BBC Sport, football (soccer) updates are posted to  a user account where any Twitter users can recieve updates on their favourite team.

Get the latest football scores by subscribing to notifications from our Twitter users. Using Twitter means you can have a choice of delivery mechanisms, including RSS and SMS, all for free!

If you'd like to have a team added, I'll be happy to do so.  Email me at latest-scores-twitter@googlegroups.com

### Credits ###
The image used on the following sites is attributed to: http://flickr.com/photos/daquellamanera/355061741/

### Football score twitter accounts ###
  * http://twitter.com/prem_scores
  * http://twitter.com/arsenal_scores
  * http://twitter.com/villa_scores
  * http://twitter.com/brum_scores
  * http://twitter.com/bolton_scores
  * http://twitter.com/burnley_scores
  * http://twitter.com/blackburn_score
  * http://twitter.com/cardiff_scores
  * http://twitter.com/charlton_scores
  * http://twitter.com/chelsea_scores
  * http://twitter.com/ebbsfleet_score
  * http://twitter.com/everton_scores
  * http://twitter.com/fulham_scores
  * http://twitter.com/hull_scores
  * http://twitter.com/leedsutd_scores
  * http://twitter.com/liverpool_score
  * http://twitter.com/mancity_scores
  * http://twitter.com/manutd_scores
  * http://twitter.com/newcastle_score
  * http://twitter.com/boro_scores
  * http://twitter.com/palace_scores
  * http://twitter.com/pompy_scores
  * http://twitter.com/sheffutd_scores
  * http://twitter.com/spurs_scores
  * http://twitter.com/stoke_scores
  * http://twitter.com/sunderlandscore
  * http://twitter.com/swindon_scores
  * http://twitter.com/tranmere_scores
  * http://twitter.com/westham_scores
  * http://twitter.com/yeovil_scores
  * http://twitter.com/york_scores
  * http://twitter.com/wigan_scores
  * http://twitter.com/wolves_scores

### Some feedback for the football scores ###

  * http://twitter.com/astonvilla/statuses/823289435
  * http://www.guardian.co.uk/technology/2008/may/08/socialnetworking.twitter
  * http://twitter.com/paulbradshaw/statuses/806631246
  * http://twitter.com/headlessness/statuses/806239327
  * http://twitter.com/Casablanca/statuses/806228646
  * http://twitter.com/philhawksworth/statuses/806221349
  * http://www.qwghlm.co.uk/blog/2008/04/19/twitters-success-and-how-to-make-money-off-it-without-being-evil/
  * http://twitter.com/philhawksworth/statuses/525188272
  * http://twitter.com/drewb/statuses/581321232
  * http://twitter.com/drewb/statuses/581066832
  * http://twitter.com/kramchandani/statuses/640736052
  * http://twitter.com/Chris_Reed/statuses/656574932
  * http://twitter.com/drewb/statuses/657339512
  * http://robb1e.onaswarm.com/:entry:robb1e-2007-12-23-0049/#probb1e-2008-02-02-0001
  * http://twitter.com/atharh/statuses/793094315
  * http://twitter.com/peter960/statuses/802699121
  * http://twitter.com/Zece/status/1047767637


---



## Twitter Results - NBA/MLB/NHL updates ##
Similar to the football scores twitterbot, Twitter Results regularly monitors RSS feeds of sporting match results and updates are posted to  a user account where any Twitter users can recieve updates on their favourite team.

Get the latest results by subscribing to notifications from our Twitter users. Using Twitter means you can have a choice of delivery mechanisms, including RSS and SMS, all for free!

If you'd like to have a team added, I'll be happy to do so.  Email me at phawksworth (at) gmail (dot) com

### Credits ###
  * All data is source from the RSS feeds provided by http://totallyscored.com
  * The image used for the [nba\_results](http://twitter.com/nba_results) background is courtesy of [Carsonified](http://www.carsonified.com)
  * The image used for the Twitter avatars on NBA accounts is attributed to  http://www.flickr.com/photos/balakov/502470343/


### National Basketball Association twitter accounts ###
  * http://twitter.com/nba_results (all teams)
  * http://twitter.com/celtics_results
  * http://twitter.com/cavs_results
  * http://twitter.com/hornets_results
  * http://twitter.com/jazz_results
  * http://twitter.com/lakers_results
  * http://twitter.com/magic_results
  * http://twitter.com/pistons_results
  * http://twitter.com/spurs_results
  * http://twitter.com/suns_results
  * http://twitter.com/warrior_results


## Major League Baseball twitter accounts ##
  * http://twitter.com/mlb_results (all teams)
  * http://twitter.com/as_results
  * http://twitter.com/bluejay_results
  * http://twitter.com/cards_results
  * http://twitter.com/cubs_results
  * http://twitter.com/dodgers_results
  * http://twitter.com/giants_results
  * http://twitter.com/redsox_results
  * http://twitter.com/yankees_results

## National Hockey League twitter accounts ##
  * http://twitter.com/nhl_results (all teams)
  * http://twitter.com/sharks_results
  * http://twitter.com/stars_results


## More details ##

The Twitter Results twitterbot  consists of a Python script (tweet\_results.py) which is executed periodically by a Cron job.  The script imports a configuration file  (tweet\_results\_config.py)  which specifies the RSS feed sources and defines the Twitter feeds to be notified.

The script is called like this:
```
python tweet_results.py TWITTERPASSWORD LEAGUE [>> logfile.txt]
```
for example:
```
python tweet_results.py password nba >> logfile.txt
```


### Some feedback for the mlb\_results ###
  * http://twitter.com/ev/statuses/825532474
  * http://twitter.com/Timbo_/statuses/825590090
  * http://twitter.com/kpark/statuses/825583589
  * http://twitter.com/scubachris/statuses/826775255


