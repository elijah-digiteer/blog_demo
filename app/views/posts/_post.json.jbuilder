json.extract! post, :id, :title, :content, :user_id, :published_at, :active, :featured, :created_at, :updated_at
json.url post_url(post, format: :json)
