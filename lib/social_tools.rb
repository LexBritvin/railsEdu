module SocialTools
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("MY_TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("MY_TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("MY_TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("MY_TWITTER_ACCESS_SECRET")
    end

    # client.search("#rails", result_type: 'recent').take(6).collect do |tweet|
    #   "#{tweet.user.screen_name}: #{tweet.text}"
    # end
    [
        "test: test http://localhost:3000/tech-news",
        "test2: test2 http://localhost:3000/tech-news ",
        "test3: test3 http://localhost:3000/tech-news",
    ]
  end
end