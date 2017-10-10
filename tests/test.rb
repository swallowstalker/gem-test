require 'just_a_gem'

just_a_gem = JustAGem.new()

titles = just_a_gem.get_newest_reddit_titles
puts titles.first
