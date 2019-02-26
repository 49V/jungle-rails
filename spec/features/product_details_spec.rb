require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario 'They see an individual product page', js: true do
      # ACT
      visit root_path

      first('.product-link').click 

      # DEBUG / VERIFY
      save_screenshot 'product_details.png'
    
    end
end
