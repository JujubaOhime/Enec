class UserCollegeInformation < ApplicationRecord
  belongs_to :user
  belongs_to :IES
  mount_uploader :registration_proof, DocumentUploader
end
