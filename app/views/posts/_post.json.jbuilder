json.extract! post, :id, :title, :slug, :description, :banner, :starting_price, :user_id, :fields, :is_job, :created_at, :updated_at
json.url post_url(post, format: :json)
