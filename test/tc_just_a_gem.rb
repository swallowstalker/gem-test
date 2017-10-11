
require "just_a_gem"
require "test/unit"
require "minitest/mock"

class TestJustAGem < Test::Unit::TestCase

  # def test_url_success
  #   assert(JustAGem.new().get_newest_reddit_titles.length > 0, "Newest data is unavailable")
  # end

  def test_url_returns_different_structure
    assert_equal(JustAGem.new("http://google.com").get_newest_reddit_titles, [])
  end

  def test_parsing_url_data_response
    @gem = JustAGem.new()
    @gem.stub :retrieve_newest_reddit_data, {} do
      assert_equal(@gem.get_newest_reddit_titles, [])
    end

    @gem.stub :retrieve_newest_reddit_data, {"data" => "incompatible"} do
      assert_equal(@gem.get_newest_reddit_titles, [])
    end

    @gem.stub :retrieve_newest_reddit_data, [] do
      assert_equal(@gem.get_newest_reddit_titles, [])
    end

    @gem.stub :retrieve_newest_reddit_data, "text only bro" do
      assert_equal(@gem.get_newest_reddit_titles, [])
    end
  end

end
