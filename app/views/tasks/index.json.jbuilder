json.array!(@tasks) do |task|
  json.extract! task, :id, :description, :hoursworked, :date
  json.url task_url(task, format: :json)
end
