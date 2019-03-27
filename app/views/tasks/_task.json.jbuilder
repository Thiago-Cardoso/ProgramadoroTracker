json.extract! task, :id, :category, :description, :status, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
