require 'net/http'
require 'json'

# After all, this is just a gem
# This gem retrieve newest reddit topics, and return their titles in a list.
class JustAGem

  def initialize(uri="https://www.reddit.com/r/subreddit/new.json")
    @newest_reddit_uri = URI(uri)
  end

  # get newest reddit titles only
  def get_newest_reddit_titles

    result = retrieve_newest_reddit_data()

    titles = []
    begin
      result["data"]["children"].each do |child|
        titles << child["data"]["title"]
      end
    rescue
      puts "Incompatible structure for reddit data titles"
    end

    return titles
  end


  private

  # retrieve newest reddit (entire structure)
  def retrieve_newest_reddit_data
    result = {}
    begin
      result = JSON.parse(Net::HTTP.get(@newest_reddit_uri))
    rescue
      puts "Cannot parse JSON from given URL: #{@newest_reddit_uri}"
    end

    return result
  end

end
