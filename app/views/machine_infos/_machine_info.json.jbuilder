json.extract! machine_info, :id, :name, :created_at, :updated_at
json.url machine_info_url(machine_info, format: :json)