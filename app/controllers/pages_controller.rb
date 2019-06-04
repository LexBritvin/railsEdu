class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = SocialTools.twitter_search
  end
end
