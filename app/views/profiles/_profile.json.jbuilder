json.extract! profile, :id, :user_id, :avatar, :bio, :working_field, :is_seller, :created_at, :updated_at
json.url profile_url(profile, format: :json)
