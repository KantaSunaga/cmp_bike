json.extract! series, :id, :series_name, :created_at, :updated_at
json.url series_url(series, format: :json)