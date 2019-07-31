require('pry-byebug')
require_relative('./models/Artist.rb')
require_relative('./models/Album.rb')

Artist.delete_all()

artist1 = Artist.new(
  {
    'name' => 'Cat Choir',
  }
)

artist2 = Artist.new(
{
  'name' => 'Angry Unicorns'
}
)

artist1.save()
artist2.save()

album1 = Album.new(
  {
    'title' => 'Meow Meow',
    'genre' => 'Pop',
    'artist_id'=> artist1.id
  }
)

album2 = Album.new(
  {
    'title' => 'No Rainbows',
    'genre' => 'Metal',
    'artist_id' => artist2.id
  }
)

album3 = Album.new(
  {
    'title' => 'Bloody Hooves',
    'genre' => 'Metal',
    'artist_id' => artist2.id
  }
)

album1.save()
album2.save()
album3.save()


binding.pry
nil
