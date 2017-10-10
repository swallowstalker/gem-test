require 'net/http'
require 'json'

class JustAGem

  # get newest reddit titles only
  def get_newest_reddit_titles
    puts "This is list of new reddit topics"

    result = retrieve_newest_reddit_data()

    titles = []
    result["data"]["children"].each do |child|
      titles << child["data"]["title"]
      # puts "--------------------"
      # puts child["data"]["title"]
      # puts "--------------------"
    end

    return titles
  end


  private

  # Retrieve newest reddit (entire structure)
  def retrieve_newest_reddit_data
    uri = URI("https://www.reddit.com/r/subreddit/new.json")
    result = JSON.parse(Net::HTTP.get(uri))
    # puts "Retrieval completed!"
    return result
  end

end
