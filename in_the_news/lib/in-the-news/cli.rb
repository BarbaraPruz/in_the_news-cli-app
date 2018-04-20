module InTheNews
  class CLI

    def call

      welcome

      # create/collect today's stories.
      # ToDo: Make sure nothing has gone wrong
      Story.create_stories_from_collection(Scraper.collect_stories)

      # if all ok, show/do menu
      done = false
      while !done
        show_stories
        puts "Select Story Number (or 0 to exit)"
        user_option = gets.strip().to_i
        puts "option #{user_option}"
        done = true if user_option == 0
      end

      puts "Thanks for checking the news"
    end

    def welcome
      puts "Welcome to In The News - top stories from the Christian Science Monitor(CSM)"
      puts "In a world of news sound bites, CSM is an independent international news organization that"
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