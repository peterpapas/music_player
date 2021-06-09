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
    begin
        puts "\n------Update Albums------"
        puts "1. To update Album title"
        puts "2. to update Album genre"
        puts "3. to exit"
        choice = read_integer_in_range("Please enter your choice and press ENTER", 1,3)
        case choice 
            when 1
                puts "\nCurrent album title is: " + album.title
                album.title = read_string("Enter the new title: ")
                puts "Album Title got updated to: " + album.title
                finished = read_string('Press ENTER to continue')
            when 2 
                puts "\nCurrent album genre is: " + album.genre.to_s
                puts("------Select Genre------")
                puts('1. Pop')
                puts('2. Classic')
                puts('3. Jazz')
                puts('4. Rock')
                album.genre = read_integer("Enter the new album Genre: ")
                puts "Album Genre got updated to: " + album.genre.to_s
                finished = read_string('Press ENTER to continue')
            when 3 
                if (choice == 3)
                    finished = true
                end
                    else
                        puts"Please select again"
                    end until finished
                    
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


#option 3
def play_album(albums)
    finished = false
    begin
        puts"\n------Play Album------"
        puts"1. Play Album"
        puts"2. EXIT"
        selection = read_integer_in_range("Please enter your choice", 1,3)
        case selection
        when 1
            album_id = read_integer_in_range("Please enter an Album ID",1, albums.length)
            puts("You selected Album: " + (albums[album_id - 1]).title)
            print_title_tracks(albums[album_id - 1 ].tracks) 
            track_num = read_integer_in_range("Please enter a Track number",1, albums[album_id - 1 ].tracks.length )
            puts "Playing track: " + albums[album_id - 1].tracks[track_num - 1].name
            puts "\u266a" + "\u266b" + "\u266a" + "\u266b" + "\u266a" + "\u266b" +"\u266a" + "\u266b" + "\u266a" + "\u266b" + "\u266a" + "\u266b"
            sleep (5) 
        when 2
            finished = true
        else 
            puts "Please select again"
        end
    end until finished 

end

def print_album_genres albums
    puts("\n------Select Genre------")
    puts('1. Pop')
    puts('2. Classic')
    puts('3. Jazz')
    puts('4. Rock')
    search_genre = read_integer('Enter genre number: ')
    i = 0
    while i < albums.length
        if search_genre == albums[i].genre
            print_album(albums[i])
        end
        i += 1
    end
end


def print_track track
	puts('Track title is: ' + track.name)
    puts('Track file location is: ' + track.location)
end

def print_tracks tracks
	count = tracks.length
	i = 0
	while (i < count)
	print_track(tracks[i]) 
	i += 1
	end
end

def print_album album
    puts 'Artist is: ' + album.artist.to_s
    puts 'Title is: ' + album.title.to_s
    puts 'Genre is ' + album.genre.to_s
    puts 'Genre is ' +  $genre_names[album.genre]

    print_tracks(album.tracks) 
end

def print_albums albums
	count = albums.length
	i = 0
    puts 'Album Count ID is: ' + albums.length.to_s
    while (i < count)
	print_album(albums[i]) 
	i += 1
	end
end

#option 2
def display_albums(albums)
    finished = false
    begin
    puts "\n------Display Albums------"
    puts '1.  Display All'
    puts '2.  Display Genre'
    choice = read_integer_in_range("Option: ", 1, 2)
        case choice
        when 1
            print_albums(albums)
        when 2
            print_album_genres(albums)
        else
            puts 'Please select again'
        end
    finished = read_string('Press ENTER to continue')
    end until finished
end


def read_track music_file
	name = music_file.gets.chomp
    location = music_file.gets
    track = Track.new(name, location)
    return track
end

def read_tracks music_file
	count = music_file.gets().to_i
    tracks = Array.new
        while (0 < count)
            track = read_track(music_file)
            tracks << track
            count -= 1
        end
	return tracks
end

def read_album music_file
		album_artist = music_file.gets
		album_title = music_file.gets
		album_genre = music_file.gets.to_i
        tracks = read_tracks(music_file)
        album = Album.new(album_artist, album_title, album_genre, tracks)
        return album
end

def read_albums music_file
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
    begin
    puts "\n------Enter Album------"
    album_file = read_string('Enter File Name (Ex. album.txt): ')
    music_file = File.new(album_file, "r")
        if music_file
            albums = read_albums(music_file)
            music_file.close()
        else
            puts "Unable to open file to read!" 
        end
    puts 'Music File Loaded'
    finished = read_string('Press ENTER to continue')
    end until finished
    return albums
end

#Main menu
def main_menu_albums
    finished = false
    begin
    puts "\n------Main Menu------"
    puts '1. Read Album File'
    puts '2. Display Album Info'
    puts '3. Play Album'
    puts '4. Update Album'
    puts '5. Exit'
    choice = read_integer_in_range("Choose Option and press ENTER: ", 1, 5)
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
    end until finished
end

def main
    main_menu_albums
end

main