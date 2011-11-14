class Email < ActiveRecord::Base
  belongs_to :domain

  validates :address,
            :presence => true

  validates :domain_id,
            :presence => true


  def full_address
    "#{address}@#{domain.name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
