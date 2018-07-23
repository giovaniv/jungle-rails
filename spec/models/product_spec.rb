require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    my_category = Category.new( name: "Category" )
    subject { described_class.new( name: "Product", price: 50, quantity: 10, category: my_category ) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it 'It is not valid without a Name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'It is not valid without a Price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'It is not valid without a Quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'It is not valid without a Category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end
