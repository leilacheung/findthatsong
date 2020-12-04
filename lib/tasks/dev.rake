desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  ["alice", "bob", "carol"].each do|username|
    u = User.new
    u.username = username
    u.email = "#{username}@example.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.save

    p u.errors.full_messages

    end

    alice = User.where({ :username => "alice" }).first

    rand(5).times do
      s = Song.new
      s.title = Faker::Music::Prince.song
      s.artist = Faker::Music.band

      s.save
    end

    rand(5).times do
      playlist = Playlist.new
      playlist.title = Faker::Music.album

      playlist.save
    end

    rand(5).times do
      mood = Mood.new
      mood.label = Faker::Music.genre

      mood.save
    end


end
