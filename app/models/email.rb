class Email < ActiveRecord::Base
  validates :address,
            :uniqueness => true,
            :presence => true,
end
