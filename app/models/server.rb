class Server < ActiveRecord::Base
  validates :name,
            :uniqueness => true,
            :presence => true

  has_and_belongs_to_many :domains
end
