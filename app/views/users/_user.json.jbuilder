json.extract! user, :id, :vorname, :nachname, :email, :created_at, :updated_at, :rechte
json.url user_url(user, format: :json)
