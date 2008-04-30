require 'net/http'
require 'uri'

twitter_username = ARGV[0]
twitter_password = ARGV[1]
force = ARGV[3]

notices = Array.new

url = URI.parse(ARGV[2])
res = Net::HTTP.get(url)
res.gsub('/class="commgoal">','')

myArray = res.scan(/class="commGoal">[0-9A-Za-z: \t\n\r\f<\/>-]*div>/)
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

url = URI.parse('http://twitter.com/statuses/user_timeline/' + ARGV[0] + '.xml')
url.user = twitter_username
url.password = twitter_password

res = Net::HTTP.get(url)

tweats = Array.new

all_tweats = res.scan(/<text>.*<\/text>/)
all_tweats.each {|elt|
    tweat = elt.gsub('<text>', '')
    tweat = tweat.gsub('</text>', '')
    tweats.insert(0, tweat)
}

#puts all_tweats

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
        to_post.insert(0, elt)
    end
                                                                                }
    #puts "###### tweats to post #######"
    #puts to_post
    #puts "###### tweats to post #######"
    to_post.reverse_each {|status|
        url = URI.parse('http://twitter.com/statuses/update.xml')
        url.user = twitter_username
        url.password = twitter_password
        res = Net::HTTP.post_form(url, {'status' => status})
        #puts res
    }

end  