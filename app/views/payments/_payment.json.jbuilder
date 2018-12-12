json.extract! payment, :id, :package_id, :payment_option, :parceling_option, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
