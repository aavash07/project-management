json.data do
  json.id(@user.id)
  json.type @user.class.name
  json.attributes do
    json.token @token
    json.email @user.email
    json.name "#{@user.first_name} #{@user.last_name}"
    json.country @user.country
    json.createdAt @user.created_at
    json.updatedAt @user.updated_at
  end
end
