class User < ApplicationRecord
  has_secure_password
  has_one :lot
  has_one :IES

  mount_uploader :image, ImageUploader
  mount_uploader :registration_proof, DocumentUploader
  # Returns the hash digest of the given string.
 
  enum gender: {"Masculino": 1 , "Feminino": 2}
  enum payment_option: {"Boleto": 1, "Cartão de crédito": 2}
  enum payment_status: {"Pago": 1, "pendente": 2}
  enum parceling_option: {"1 vez": 1, "2 vezes": 2, "3 vezes": 3, "4 vezes": 4, "5 vezes": 5 }
  

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
