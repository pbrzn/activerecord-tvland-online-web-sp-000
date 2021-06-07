class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list

    self.actors.map {|a| a.full_name }
  end

  def build_network(hash)
    network = Network.create(hash).tap {|n| n.shows << self }
  end
end
