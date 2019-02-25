require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    RSpec.configure do |config|
      config.before(:all, :authorized => true) do
        @category = Category.create(
          name: 'Test Category'
        )
      end
    end

    it 'should validate for product with valid fields', authorized: true do
      # Create Product with all valid fields
      @product = Product.create(
        name: 'Test Product',
        description: 'Lorem Hipsum',
        image: 'apparel1.jpg',
        price_cents: 6500,
        quantity: 15,
        category_id: @category.id
      )
      expect(@product.id).to be_present
    end

    it 'should not validate for product without name', authorized: true do
      # Create Product with all valid fields except for name
      @product = Product.create(
        description: 'Lorem Hipsum',
        image: 'apparel1.jpg',
        price_cents: 6500,
        quantity: 15,
        category_id: @category.id
      )
      expect(@product.id).to be_nil
    end

    it 'should not validate for product without price_cents', authorized: true do
      # Create Product with all valid fields except for price_cents
      @product = Product.create(
        name: 'Test Product',
        description: 'Lorem Hipsum',
        image: 'apparel1.jpg',
        quantity: 15,
        category_id: @category.id
      )
      expect(@product.id).to be_nil
    end

    it 'should not validate for product without quantity', authorized: true do
      # Create Product with all valid fields except for 
      @product = Product.create(
        name: 'Test Product',
        description: 'Lorem Hipsum',
        image: 'apparel1.jpg',
        price_cents: 6500,
        category_id: @category.id
      )
      expect(@product.id).to be_nil
    end

    it 'should not validate for product without a category', authorized: true do
      @product = Product.create(
        name: 'Test Product',
        description: 'Lorem Hipsum',
        image: 'apparel1.jpg',
        price_cents: 6500,
        quantity: 15,
      )
      expect(@product.id).to be_nil
    end

  end
end
