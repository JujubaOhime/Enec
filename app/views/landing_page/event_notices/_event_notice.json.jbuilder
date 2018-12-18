json.extract! event_notice, :id, :title, :content, :created_at, :updated_at
json.url event_notice_url(event_notice, format: :json)
