json.extract! user, :id, :email, :delegation, :lot_id, :name, :cpf, :rg, :rg_issuing_body, :birth_date, :gender, :address, :city, :state, :IES_name, :IES_city, :IES_state, :IES_course, :IES_period, :IES_registration_proof, :created_at, :updated_at
json.url user_url(user, format: :json)
