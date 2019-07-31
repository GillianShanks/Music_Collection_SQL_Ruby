require_relative('../db/sql_runner.rb')
require_relative('./Album.rb')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(artist)
    @id = artist['id'].to_i if artist['id']
    @name = artist['name']
  end



end
