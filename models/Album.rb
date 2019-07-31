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

  # def self.all()
  #   sql = "SELECT * FROM albums"
  #
  # end

end
