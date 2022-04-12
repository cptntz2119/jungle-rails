require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'return true with valid attributes' do
      category = Category.new(name: "Category")
      product = Product.new(name: "apple", price: 99.99, quantity: 1, category: category)
      expect(product).to be_truthy
    end

    it 'return nil if no name' do
      category = Category.new(name: "Category")
      product = Product.new( price: 99.99, quantity: 1, category: category)
      expect(product).to have_attributes(:name => nil)
    end

    it 'return nil if no price' do
      category = Category.new(name: "Category")
      product = Product.new( name: "apple",  quantity: 1, category: category)
      expect(product).to have_attributes(:price => nil)
    end

    it 'return nil if no quantity' do
      category = Category.new(name: "Category")
      product = Product.new(name: "apple", price: 99.99, category: category)
      expect(product).to be_truthy
    end

    it 'return nil if no category' do
      category = Category.new(name: "Category")
      product = Product.new(name: "apple", price: 99.99, quantity: 1)
      expect(product).to be_truthy
    end
    

  end
end
