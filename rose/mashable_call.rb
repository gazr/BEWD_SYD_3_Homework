require 'json'
require 'rest-client'

class MashableCall

    attr_accessor :stories



    def show_all_stories(stories)
      stories.each do |story|
      puts "Story: #{story[:title][0..80].gsub(/\s\w+\s*$/, '...')}, Category: (#{story[:category]})"
      end
    end

    def construct_story_hash(title, category)
        { :title => title, :category => category }
    end

    def process_mashable_stories(stories, user_selection)
     rest_data = RestClient.get('http://mashable.com/stories.json')
      json_data = JSON.parse(rest_data)
      stories_to_show_user = json_data[user_selection]

      stories_to_show_user.each do |news_story|
      story_hash = construct_story_hash(news_story['title'], news_story['channel'])
      stories << story_hash
      end
    end
end
