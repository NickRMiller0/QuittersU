json.array!(@step_images) do |step_image|
  json.extract! step_image, :id
  json.url step_image_url(step_image, format: :json)
end
