class BackgroundsSerializer
  include JSONAPI::Serializer

  attributes  :location, :image

  attributes :image do |images|
    images.image.take(1).map do |image|
      {
        image_url: image[:urls][:full],
        credit: {
                  source: "unsplash.com",
                  author: image[:user][:name],
                  author_profile: image[:user][:links][:self],
                  author_image: image[:user][:profile_image][:small]
                }
      }
    end
  end
end
