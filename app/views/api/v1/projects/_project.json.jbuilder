json.id project.id
json.type project.class.name
json.attributes do
  json.title project.title
  json.thumbnail Rails.application.routes.url_helpers.rails_blob_url(project.thumbnail, host: request.base_url)
  json.description project.description
  json.location project.location
  json.type project.project_type
  json.ownerName "#{project.user.first_name} #{project.user.last_name}"
  json.createdAt project.created_at
  json.updatedAt project.updated_at
end
