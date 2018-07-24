require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @category = Category.new(name: "Books")
      @product = Product.new(name: "My book", price: 20, quantity: 100, category: @category)
      expect(@product).to be_valid
    end

    it "It is not valid without a NAME" do
      @category = Category.new(name: "Books")
      @product = Product.new(name: nil, price: 20, quantity: 100, category: @category)
      expect(@product).to_not be_valid
    end

    it "It is not valid without a PRICE" do
      @category = Category.new(name: "Books")
      @product = Product.new(name: "My book", price: nil, quantity: 100, category: @category)
      expect(@product).to_not be_valid
    end

    it "It is not valid without a QUANTITY" do
      @category = Category.new(name: "Books")
      @product = Product.new(name: "My book", price: 20, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it "It is not valid without a CATEGORY" do
      @category = Category.new(name: "Books")
      @product = Product.new(name: "My book", price: 20, quantity: 100, category: nil)
      expect(@product).to_not be_valid
    end

  end
end
