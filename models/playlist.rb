class Playlist < ActiveRecord::Base
  has_and_belongs_to_many :songs

  def to_s
    "#{name} has the following songs:\n  " + songs.each_with_index.map { |song, index| "(#{index+1}) #{song.to_s}" }.join("\n  ")
  end
end
