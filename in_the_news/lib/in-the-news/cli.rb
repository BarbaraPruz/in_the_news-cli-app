module InTheNews
  class CLI

    def call
      welcome

      # create/collect today's stories.
      # ToDo: Make sure nothing has gone wrong
      puts "Collecting stories..."
      Story.create_stories_from_source(CSMScraper)

      # until user says no more, show story titles and show detaisl for selected story
      done = false
      while !done
        show_stories
        puts "Select Story Number (or 0 to exit)"
        user_option = gets.strip().to_i
        case user_option
        when 1..Story.all.length
          story_details(Story.all[user_option-1])
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

    def story_details (story)
      puts "\nSummary:"
      puts story.summary
      puts "\nFor complete article, go to"
      puts "\t#{story.url}"
    end
  end
end
