require'spec_helper'

describe 'product' do
  describe "presence of data" do
    it "is valid with a title, description and image_url"

    it "is invalid without title" do
      expect(Product.new(title: nil)).to have(2).errors_on(:title)
    end

    it "is invalid without description" do
      expect(Product.new(description: nil)).to have(1).errors_on(:description)
    end

    it "is invalid without image_url" do
      expect(Product.new(image_url: nil)).to have(1).errors_on(:image_url)
    end
  end

  describe "duplicate data" do
    it "is invalid with duplicate title" do
      Product.create(
        title: "test title",
        description: "test description",
        price: "0.01",
        image_url: "image.jpg")
      product = Product.new(
        title: "test title",
        description: "test description",
        price: "0.01",
        image_url: "image.jpg")
      expect(product).to have(1).errors_on(:title)
    end
  end

  describe "content data" do
    it "is invalid if price is minor than 0.01" do
      product = Product.create(
        title: "test title",
        description: "test description",
        price: "0",
        image_url: "image.jpg")
      expect(product).to have(1).errors_on(:price)
    end

    it "is invalid if title length is minor than 10"

    it "is invalid if the image_url doesn't have extension gif, jpg or png"
  end
end