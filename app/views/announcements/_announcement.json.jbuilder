json.extract! announcement, :id, :title, :category, :description, :condition, :price, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
