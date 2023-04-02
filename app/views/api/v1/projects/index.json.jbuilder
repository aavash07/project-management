json.data(@projects) do |project|
  json.partial!('api/v1/projects/project', project: project)
end
