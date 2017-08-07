require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.create!(name: 'Apparel')
    end

    it 'creates a product' do
      product = Product.create!(name: 'hat', price: 13.99, quantity: 50, category: @category)
      expect(product).to be_valid
    end

    it 'name cannot be blank' do
      product = Product.new(name: nil, price: 13.99, quantity: 50, category: @category)
      expect(product).not_to be_valid
      expect(product.errors[:name]).to eql ["can't be blank"]
    end

    it 'price cannot be blank' do
      product = Product.new(name: 'hat', quantity: 50, category: @category)
      expect(product).not_to be_valid
      expect(product.errors[:price]).to eql ["is not a number", "can't be blank"]
    end

    it 'price cannot be blank' do
      product = Product.new(name: 'hat', price: 13.99, quantity: nil, category: @category)
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to eql ["can't be blank"]
    end

    it 'category cannot be blank' do
      product = Product.new(name: 'hat', price: 13.99, quantity: 50, category: nil)
      expect(product).not_to be_valid
      expect(product.errors[:category]).to eql ["can't be blank"]
    end

  end
end

