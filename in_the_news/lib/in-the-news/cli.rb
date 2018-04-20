module InTheNews
  class CLI

    def call
      welcome

      # create/collect today's stories.
      # ToDo: Make sure nothing has gone wrong
      Story.create_stories_from_source(CSMScraper)

      # if all ok, show/do menu
      done = false
      while !done
        show_stories
        puts "Select Story Number (or 0 to exit)"
        user_option = gets.strip().to_i
        case user_option
        when 1..Story.all.length
          puts Story.all[user_option-1].summary
        when 0
          done = true
        end
      end

      puts "Thanks for checking the news!"
    end

    def welcome
      puts "Welcome to In The News - most viewed stories from the Christian Science Monitor(CSM)"
      puts "In a world of news sound bites, CSM is a non-profit news organization that"
      puts "'seeks to cut through the froth of the political spin cycle to underlying truths and values.'"
    end

    def show_stories
      puts "\nToday's Stories:"
      Story.all.each_with_index do  | story, index |
        puts "#{index+1}. #{story.title}"
      end
    end

  end
end
