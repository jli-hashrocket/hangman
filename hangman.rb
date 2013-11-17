#!/usr/bin/env ruby
require 'pry'
require_relative "hangman_logic"

word_bank = []
File.open('wordbank.txt') do |words|
  word_bank = words.read.split(" ")
end
stored_word =  word_bank.sample

puts "Welcome to Hangman!\n\n"
new_game = Hangman.new(stored_word)

while !new_game.game_over?  
  #guess a single letter or word
  new_game.progress
  new_game.respond
end