class Domain < ActiveRecord::Base
  has_many :emails
  has_and_belongs_to_many :servers
end
