json.extract! machine_result, :id, :name, :created_at, :updated_at
json.url machine_result_url(machine_result, format: :json)