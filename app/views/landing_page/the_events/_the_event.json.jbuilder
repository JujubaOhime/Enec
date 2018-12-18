json.extract! the_event, :id, :title, :days, :content, :created_at, :updated_at
json.url the_event_url(the_event, format: :json)
