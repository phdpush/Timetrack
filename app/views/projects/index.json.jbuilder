json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :project_description
  json.url project_url(project, format: :json)
end
