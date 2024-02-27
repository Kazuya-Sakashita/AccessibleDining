FactoryBot.define do
  factory :restaurant_image do
    after(:build) do |restaurant_image|
      restaurant_image.image.attach(
        io: File.open('spec/fixtures/files/images/test_image.jpeg'),
        filename: 'test_image.jpeg', # ファイルの実際の拡張子に合わせて修正
        content_type: 'image/jpeg'   # MIMEタイプをファイルの種類に合わせて修正
      )
    end

    # `association`を`factory`ブロック内に移動
    association :restaurant
  end
end
