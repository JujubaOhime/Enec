class User < ApplicationRecord
  belongs_to :lot
  # Returns the hash digest of the given string.
  mount_uploader :image, ImageUploader
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
