module PagesHelper
  def twitter_parser(tweet)
    regex = %r{
      (?:(?:https?|ftp):\/\/|\b(?:[a-z\d]+\.))(?:(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))?\))+(?:\((?:[^\s()<>]+|(?:\(?:[^\s()<>]+\)))?\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))?
    }ix
    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
  end
end
