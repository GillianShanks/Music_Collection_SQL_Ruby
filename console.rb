require('pry-byebug')

artist1 = Artist.new(
  {
    'name' => 'Cat's Choir,
  }
)

artist2 = Artist.new(
{
  'name' => 'Angry Unicorns'
}
)

album1 = Album.new(
  {
    'title' => 'Meow Meow',
    'genre' => 'pop',
    'artist_id'=> artist1.id
  }
)

album2 = Album.new(
  {
    'title' => 'No Rainbows'
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




binding.pry
nil
