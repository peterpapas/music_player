require './input_functions'

module Genre
    POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Track
    attr_accessor :name, :location

        def initialize (name, location)
            @name = name
            @location = location
        end
end


    class Album
        attr_accessor :title, :artist, :genre, :tracks

        def initialize (title, artist, genre, tracks)
            @title = title
            @artist = artist
            @genre = genre
            @tracks = tracks
        end
    end

#option 4
def update_album(albums)
    finished = false
    search_album = read_integer_in_range("Enter Album ID and press ENTER",1,3)
    album = albums[search_album - 1]
    puts "You have chosen to update Album: " + album.title
  
    menu = """
    ╔═══════════════════════════╗
    ║-------Update Albums-------║
    ║  1. To update Album title ║
    ║  2. to update Album genre ║
    ║  3. to exit               ║
    ║                           ║
    ╚═══════════════════════════╝
    Please enter your choice and press ENTER 
    """
  
    until finished
      puts menu
      choice = read_integer_in_range("", 1, 3)
      case choice 
      when 1
        puts "\nCurrent album title is: " + album.title
        album.title = read_string("Enter the new title: ")
        puts "Album Title got updated to: " + album.title
        finished = read_string('Press ENTER to continue')
      when 2 
        puts "\nCurrent album genre is: " + album.genre.to_s
        genre_menu = """
        ╔════════════════════════╗
        ║------Select Genre------║
        ║  1. Pop                ║
        ║  2. Classic            ║
        ║  3. Jazz               ║
        ║  4. Rock               ║
        ╚════════════════════════╝
        """
        puts genre_menu
        album.genre = read_integer("Enter the new album Genre: ")
        puts "Album Genre got updated to: " + album.genre.to_s
        finished = read_string('Press ENTER to continue')
      when 3 
        finished = true
      else
        puts "Please select again"
      end
    end
  end

def print_title_track track
	puts('Track title is: ' + track.name)
    puts('Track file location is: ' + track.location)
end

def print_title_tracks tracks
	count = tracks.length
	i = 0
	while (i < count)
        print_title_track(tracks[i])
        i += 1
	end
end

def print_album_title_and_tracks album
    puts album.title.to_s
    # print out the tracks
    print_title_tracks(album.tracks) 
end

def print_albums_id_tracks albums
	count = albums.length
	i = 0
    while (i < count)
        print ' ID is ' + i.to_s + " for: "
        print_album_title_and_tracks(albums[i])
        i += 1
	end
end


def print_album_title album
    puts  album.title.to_s
end

def print_albums_id albums
	count = albums.length
	i = 0
    while (i < count)
        print ' ID is ' + i.to_s + " for: "
        print_album_title(albums[i]) 
        i += 1
	end
end


def play_by_id(albums)
    print_albums_id(albums) 


    puts('Select Album ID')  
    id = read_integer_in_range('Enter number: ', 0, 2)  

    print_album_id_tracks(id)
end


# Option 3
def play_album(albums)
    finished = false
    while !finished
      menu = """
        ╔════════════════════════╗
        ║        Play Album      ║
        ║ 1. Play Album          ║
        ║ 2. Exit                ║
        ╚════════════════════════╝
        Please enter your choice: 
      """
      puts menu
      selection = read_integer_in_range("Please enter your choice", 1, 2)
      case selection
      when 1
        album_id = read_integer_in_range("Please enter an Album ID", 1, albums.length)
        puts("You selected Album: " + (albums[album_id - 1]).title)
        print_title_tracks(albums[album_id - 1].tracks)
        track_num = read_integer_in_range("Please enter a Track number", 1, albums[album_id - 1].tracks.length)
        puts "Playing track: " + albums[album_id - 1].tracks[track_num - 1].name
        puts "♪♫♪♫♪♫♪♫♪♫♪♫♪♫♪♫♪♫♪♫♪♫"
        sleep(5)
      when 2
        finished = true
      else 
        puts "Please select again"
      end
    end 
  end
  
  def print_album_genres(albums)
    menu = """
      \n╔════════════════════════╗
        ║      Select Genre      ║
        ║ 1. Pop                 ║
        ║ 2. Classic             ║
        ║ 3. Jazz                ║
        ║ 4. Rock                ║
        ╚════════════════════════╝\n
    """
    puts menu
    search_genre = read_integer('Enter genre number: ')
    i = 0
    while i < albums.length
      if search_genre == albums[i].genre
        print_album(albums[i])
      end
      i += 1
    end
  end
  
  def print_track(track)
    puts "Track title is: #{track.name}"
    puts "Track file location is: #{track.location}"
  end
  
  def print_tracks(tracks)
    count = tracks.length
    i = 0
    while i < count
      print_track(tracks[i]) 
      i += 1
    end
  end
  
  def print_album(album)
    menu = """
        ╔══════════════════════════════════════╗
        ║      Album Information               ║
        ║ Artist: #{album.artist}              
        ║ Title: #{album.title}                
        ║ Genre: #{$genre_names[album.genre]}  
        ╚══════════════════════════════════════╝
        Tracks:
    """
    puts menu
    print_tracks(album.tracks) 
  end
  
  def print_albums(albums)
    count = albums.length
    puts "Album Count ID is: #{albums.length}"
    i = 0
    while i < count
      print_album(albums[i]) 
      i += 1
    end
  end

#option 2
def display_albums(albums)
    finished = false
    while !finished do
      menu = """
      ╔════════════════════════╗
      ║------Display Albums----║
      ║  1. Display All        ║
      ║  2. Display Genre      ║
      ╚════════════════════════╝
      Option:
      """
      puts menu
      choice = read_integer_in_range("", 1, 2)
      case choice
      when 1
        print_albums(albums)
      when 2
        print_album_genres(albums)
      else
        puts 'Please select again'
      end
      finished = read_string('Press ENTER to continue')
    end
  end
  
  def read_track(music_file)
    name = music_file.gets.chomp
    location = music_file.gets
    track = Track.new(name, location)
    return track
  end
  
  def read_tracks(music_file)
    count = music_file.gets().to_i
    tracks = Array.new
    while (0 < count)
      track = read_track(music_file)
      tracks << track
      count -= 1
    end
    return tracks
  end
  
  def read_album(music_file)
    album_artist = music_file.gets
    album_title = music_file.gets
    album_genre = music_file.gets.to_i
    tracks = read_tracks(music_file)
    album = Album.new(album_artist, album_title, album_genre, tracks)
    return album
  end
  
  def read_albums(music_file)
    count = music_file.gets().to_i
    albums = Array.new
    while (0 < count)
      album = read_album(music_file)
      albums << album
      count -= 1
    end
    return albums
  end


#option 1
def read_album_file
    finished = false
    while !finished do
      menu = """
        ╔═══════════════════════════════════╗
        ║     ------Enter Album------       ║
        ║  Enter File Name (Ex. album.txt): ║
        ╚═══════════════════════════════════╝
      """
      puts menu
      album_file = read_string("")
      music_file = File.new(album_file, "r")
      if music_file
        albums = read_albums(music_file)
        music_file.close()
      else
        puts "Unable to open file to read!" 
      end
      puts 'Music File Loaded'
      finished = read_string('Press ENTER to continue')
    end
    return albums
  end

#Main menu
def main_menu_albums
    finished = false
    while !finished do
      menu = <<~MENU
        ╔════════════════════════╗
        ║--------Main Menu-------║
        ║  1. Read Album File    ║
        ║  2. Display Album Info ║
        ║  3. Play Album         ║
        ║  4. Update Album       ║
        ║  5. Exit               ║
        ╚════════════════════════╝
        Choose Option and press ENTER:
      MENU
      puts menu
      choice = read_integer_in_range("", 1, 5)
      case choice
      when 1
        albums = read_album_file
      when 2
        display_albums(albums)
      when 3
        play_album(albums)
      when 4
        update_album(albums)
      when 5
        finished = true
      else
        puts 'Please select again'
      end
    end
  end

def main
    main_menu_albums
end

main