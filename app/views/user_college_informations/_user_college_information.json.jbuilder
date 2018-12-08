json.extract! user_college_information, :id, :user_id, :IES_id, :course, :period, :registration_proof, :created_at, :updated_at
json.url user_college_information_url(user_college_information, format: :json)
