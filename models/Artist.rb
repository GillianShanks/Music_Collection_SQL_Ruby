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
    return SqlRunner.run(sql)

  end

end
