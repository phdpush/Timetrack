json.array!(@project_users) do |project_user|
  json.extract! project_user, :id, :project_id, :user_id
  json.url project_user_url(project_user, format: :json)
end
