require './lib/itunes_bot'

desc 'Tidy the iTunes database'
task :tidy do
  puts "Tidying up iTunes Library..."
  
  bot = ItunesBot.new('Music')
  bot.tidy
  
  if bot.unknown_genres.any?
    puts "Some unknown genres has been found :"
    bot.unknown_genres.each do |genre|
      puts "\t* #{genre}"
    end
  else
    puts "All genres were okay"
  end
end

desc 'Run the Utit::Test suite'
task :test do
  require 'test/utils_test'
end