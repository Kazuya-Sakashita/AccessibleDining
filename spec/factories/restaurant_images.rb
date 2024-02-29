FactoryBot.define do
  factory :restaurant_image do
    association :restaurant

    after(:build) do |restaurant_image|
      image_path = Rails.root.join('spec/fixtures/files/images/test_image.jpeg')
      restaurant_image.image.attach(
        io: File.open(image_path),
        filename: 'test_image.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
