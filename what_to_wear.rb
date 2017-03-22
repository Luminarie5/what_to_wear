# name: "Что одеть?"
# author: Shubin Pavlik
# version: 1.2
#
# ruby_version: 2.3
# encoding: utf-8

require_relative './lib/wardrobe'

files_path = File.dirname(__FILE__) + '/data/'

wardrobe = Wardrobe.new
wardrobe.find_clothing(files_path + 'clothing')

puts File.readlines(files_path + 'question.txt', encoding: 'utf-8').sample
user_input = STDIN.gets.to_i

puts "\n#{File.readlines(files_path + 'invite.txt', encoding: 'utf-8').sample}\n\n"
sleep 1

wardrobe.choose_clothing(wardrobe.select_warm_clothing(user_input)).each do |dress|
  puts "#{dress.item} (#{dress.type}) #{dress.temperature}"
end
