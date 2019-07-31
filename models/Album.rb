require_relative('../db/sql_runner.rb')
require_relative('./Artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(album)
    @id = album['id'].to_i if album['id']
    @title = album['title']
    @genre = album['genre']
    @artist_id = album['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"

    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"

    albums_array = SqlRunner.run(sql)

    return albums_array.map{|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]

    artist_hash = SqlRunner.run(sql, values)[0]

    return Artist.new(artist_hash)
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"

    values = [@title, @genre, @artist_id, @id]

    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]

    SqlRunner.run(sql, values)
  end

end
