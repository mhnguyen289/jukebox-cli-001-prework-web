#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
my_songs = {
 "Go Go GO" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/01.mp3',
 "LiberTeens" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/03.mp3',
 "Guiding Light" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/04.mp3',
 "Wolf" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/05.mp3',
 "Blue" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => 'Users/colbyschulz/Development/labs/jukebox-cli-001-prework-web/audio/Emerald-Park/07.mp3'
 }

def help
  puts "I accept the following commands:"
  puts " - help : displays this help message"
  puts " - list : displays a list of songs you can play"
  puts " - play : lets you choose a song to play"
  puts " - exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  my_songs.collect do |key, path|
    puts "#{key}"
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  user_choice = gets.chomp
    if my_songs.has_key?(user_choice)
      puts "playing #{user_choice}!"
      system "open #{my_songs[user_choice]}"
    else
      puts "choice invalid"
    end
end



def exit_jukebox
  puts "Goodbye"
end


def run(my_songs) 
  input = nil
  help
  while input != "exit"
  puts "Please enter a command:"
  input = gets.chomp
    if input == "help"
      help
    elsif input == "list"
      list(my_songs)
    elsif input == "play"
      play(my_songs)
    elsif input == "exit"
      exit_jukebox
    end
  end
end
