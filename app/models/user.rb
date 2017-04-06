class User < ActiveRecord::Base
  has_secure_password                                                                                                   #Passwort durch bcrypt-gem
  #Vorname, Nachname und Email sind Pflichtfelder (neben Passwort)
  validates :vorname,
            presence: true
  validates :nachname,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"
  end
end