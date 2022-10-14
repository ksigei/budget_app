json.extract! category, :id, :name, :icon, :user_id, :created_at, :updated_at, :total_amount
json.url category_url(category, format: :json)
