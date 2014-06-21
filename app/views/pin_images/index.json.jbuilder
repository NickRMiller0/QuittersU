json.array!(@pin_images) do |pin_image|
  json.extract! pin_image, :id, :description
  json.url pin_image_url(pin_image, format: :json)
end
