require 'pry'

class Hangman
  def initialize(stored_word)
    @stored_word = stored_word
    @remaining_guesses = 8
    @correct_guesses = []
  end

  def progress
    #show how much of the word I guessed. _'s for letters left and letters unmasked when correct
    print "Word: " 
    @stored_word.each_char{ |char| 
      if @correct_guesses.include?(char)
        print char
      else
        print "_"
      end
    }
    print "\nYou have #{@remaining_guesses} guesses left\n"
  end
  def respond
    print "Guess a single letter (a-z) or the entire word: "
    response = gets.chomp
    if !response.match(/\W|\d/)
      check_char(response) if response.length == 1
      check_word(response) if response.length > 1
    else
      puts "Invalid character"
      respond
    end
  end

  def check_char(input)
    #compare response letter to the chosen word and store it
    if @stored_word.include?(input)
      @correct_guesses << input if !@correct_guesses.include?(input)
    else
      puts "Sorry, no #{input}'s found"
      @remaining_guesses -= 1 
    end
  end

  def check_word(input)
    if input == @stored_word
      puts "You win!"
      exit
    else
      puts "You lost :("
      exit 
    end
  end

  def game_over?
    return true if @remaining_guesses == 0 || @stored_word.split(//).uniq.sort == @correct_guesses.sort
    return false
  end
end