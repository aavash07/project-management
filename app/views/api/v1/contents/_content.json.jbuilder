json.id content.id
json.type content.class.name
json.attributes do
  json.projectId content.id
  json.title content.title
  json.projectOwnerName "#{content.project.user.first_name} #{content.project.user.last_name}"
  json.body content.body
  json.createdAt content.created_at
  json.updatedAt content.updated_at
end
