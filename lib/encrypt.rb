require_relative 'enigma'
require 'pry'

enigma = Enigma.new

puts "Please enter a phrase,"
phrase = gets.chomp.downcase

puts "Enter a 5 digit key (optional)"
key = gets.chomp

until key.length == 5 || key.length == 0
    puts "You need to have 5 digit key or press enter to generate a Key"
    key = gets.chomp   
end

puts "Enter a date using this format(mmddyy) (optional)"
date = gets.chomp

until date.length == 6 && !(date.include?("/")) && !(date.include?("-")) || date.length == 0
    puts "Wrong format, please use this as an example (mmddyy) or press enter to use today's date"
    date = gets.chomp
end

if key == "" && date != ""
    encrypt = enigma.encrypt(phrase,date)
elsif date == "" && key != ""
    encrypt = enigma.encrypt(phrase,key)
elsif date == "" && key == ""
    encrypt = enigma.encrypt(phrase)
else
    encrypt = enigma.encrypt(phrase,key,date)
end

puts encrypt