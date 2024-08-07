json.data do
  json.items do
    json.array!(@posts) do |post|
      json.id post.id
      json.user do
        json.name post.user.name
        json.image url_for(post.user.get_profile_image(100,100))
      end
      json.image url_for(post.image)
      json.name post.name
      json.address post.address
      json.latitude post.latitude
      json.longitude post.longitude
    end
  end
end