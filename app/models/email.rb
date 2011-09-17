class Email < ActiveRecord::Base
  belongs_to :domain

  validates :address,
            :uniqueness => true,
            :presence => true

  validates :domain_id,
            :presence => true


  def full_address
    "#{address}@#{domain.name}"
  end
end
