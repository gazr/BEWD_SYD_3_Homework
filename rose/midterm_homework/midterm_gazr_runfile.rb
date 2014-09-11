require_relative 'mashable_call.rb'

puts "This will pull stories from Mashable.com"
puts "What section would you like to see?"
puts "new, rising, or hot"

show_user = MashableCall.new
stories = []
count = 1
while count > 0
user_selection = gets.chomp
if user_selection == "new" || user_selection =="rising" || user_selection =="hot"
  show_user.process_mashable_stories(stories, user_selection)
  puts "Here you go:"
  show_user.show_all_stories(stories)
  count = 0
else
  puts "You inputed an incorrect menu item. Please only select from the following three items. Either:"
  puts "new"
  puts "rising"
  puts "hot"
end
end

