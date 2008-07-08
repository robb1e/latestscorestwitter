#!/usr/bin/env python
import urllib
import xml.dom.minidom
import re
import twitter
import sys
import tweet_results_config
import pickle
import os

to_tweet = dict()

def checkPreviousTweets(account,tweet):
	history_file_name = "history/" + account + ".dat"
	if not os.path.exists(history_file_name):
		history = []
		pickle.dump( history, open( history_file_name, "w" ) )
	history = pickle.load( open( history_file_name ) )
	for t in history:
		if t == tweet:
			print "Not tweeting (dupe) ", tweet, " ...to ", account
			return
	postToTwitter(account, tweet)
	history.insert(0, tweet)
	if len(history) > 70:
		history.pop()
	pickle.dump( history, open(history_file_name, "w" ))

def postToTwitter(account, tweet):
	print "Tweeting... ", tweet, " ...to ", account
	global tweet_count
	tweet_count += 1
	api = twitter.Api(username=account, password=twitter_password)
	api.PostUpdate(tweet)	

def getCDATA(nodelist):
	rc = ""
	for node in nodelist:
		rc = rc + node.data
	return rc
	
def handleDescription(description):
	return getCDATA(description.childNodes)

def findAccountName(team):
	global missing_accounts
	if not team in accounts:
		missing_accounts.append(team)	
	else:
		return accounts[team]

def buildTweet(score_array):
	return score_array[0] + " " + score_array[1] + " - " + score_array[3] + " " + score_array[2]

def build_score_array(score):
	p = re.compile('( \d+)')
	vt = p.split(score[0])
	ht = p.split(score[1])
	score_array = [vt[0].strip(), vt[1].strip(), ht[0].strip(), ht[1].strip()]
	return score_array

def get_score_values(item):
	description = handleDescription(item.getElementsByTagName("description")[0])
	p = re.compile('([^>]* \d+)')
	scores = p.findall(description)
	if scores:
		return build_score_array(scores)

def lodge_tweets_for_accounts(data, accounts):
	items = data.getElementsByTagName("item")
	item_count = 0
	item_limit = 20
	for item in items:
		item_count += 1
		if item_count > item_limit:
			return
		score_array = get_score_values(item)
		tweet = buildTweet(score_array)
		twitter_accounts = [accounts['LEAGUE']]
		for p in [0,2]:
			acc = findAccountName(score_array[p])
			if acc:
				twitter_accounts.append(acc)
		to_tweet[tweet] = twitter_accounts

def get_scores(uri):
	datasource = urllib.urlopen(uri)
	data = datasource.read()
	return xml.dom.minidom.parseString(data)

def main(uri, accounts):
	global missing_accounts
	global tweet_count
	# reset stats
	tweet_count = 0
	missing_accounts = []
	# Get the feed data
	scores_dom = get_scores(uri)
	# Deciper the feed and gather accounts to tweet to.
	lodge_tweets_for_accounts(scores_dom, accounts)
	for tweet in to_tweet:
		twitter_accounts = to_tweet[tweet]
		for acc in twitter_accounts:
			# print acc, tweet
			checkPreviousTweets(acc,tweet)
	#output stats
	print '------------------------'
	print "Missing accounts: ", missing_accounts
	print tweet_count, "tweets sent on this attempt." 

twitter_password = sys.argv[1]
league = sys.argv[2]
accounts = tweet_results_config.accounts(league)
uri = tweet_results_config.feeds(league)

main(uri, accounts)

