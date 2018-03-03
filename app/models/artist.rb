class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.scan(/[a-z0-9]+/).join('-')
  end

  def self.find_by_slug(slug)
    self.all.find { |e| e.slug == slug }
  end
end