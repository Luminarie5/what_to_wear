# name: "Что одеть?"
# author: Shubin Pavlik
# version: 1.0
#
# ruby_version: 2.3
# encoding: utf-8

require_relative './lib/wardrobe.rb'

files_path = File.dirname(__FILE__) + '/data/'

wardrobe = Wardrobe.new
wardrobe.find_clothing(files_path + '/clothing/')

begin
  puts File.readlines(files_path + 'question.txt', encoding: 'utf-8').sample
rescue Exception => error
  puts 'file read error'
  puts error.message
ensure
  user_input = STDIN.gets.to_i
end

begin
  puts
  puts File.readlines(files_path + 'invite.txt', encoding: 'utf-8').sample
  sleep 1
  puts
rescue Exception => error
  puts 'file read error'
  puts error.message
ensure
  wardrobe.choose_clothes(wardrobe.sort_by_temp(user_input)).each do |dress|
    puts "#{dress.item} (#{dress.type}) #{dress.temp}"
  end
end
