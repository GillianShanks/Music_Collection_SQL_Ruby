require_relative('../db/sql_runner.rb')
require_relative('./Album.rb')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists_array = SqlRunner.run(sql)
    return artists_array.map{|artist| Artist.new(artist)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]

    albums_array = SqlRunner.run(sql, values)
    return albums_array.map{|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]

    SqlRunner.run(sql, values)
  end
end
