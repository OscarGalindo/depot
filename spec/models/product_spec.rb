require 'spec_helper'

describe Product do
  describe "presence of data" do
    it "is valid with a title, description and image_url" do
      expect(build(:product)).to be_valid
    end

    it "is invalid without title" do
      expect(build(:product, title: nil)).to have(2).errors_on(:title)
    end

    it "is invalid without description" do
      expect(build(:product, description: nil)).to have(1).errors_on(:description)
    end

    it "is invalid without image_url" do
      expect(build(:product, image_url: nil)).to have(1).errors_on(:image_url)
    end
  end

  describe "duplicate data" do
    it "is invalid with duplicate title" do
      create(:product)
      product = build(:product)
      expect(product).to have(1).errors_on(:title)
    end
  end

  describe "content data" do
    it "is invalid if price is minor than 0.01" do
      product = build(:product, price: 0)
      expect(product).to have(1).errors_on(:price)
    end

    it "is invalid if title length is minor than 10" do
      product = build(:product, title: "title")
      product.valid?
      expect(product.errors[:title].to_s).to match /is too short/
    end

    it "is invalid if the image_url doesn't have extension gif, jpg or png" do
      product = build(:product, image_url: 'image.pdf')
      product.valid?
      expect(product.errors[:image_url].to_s).to match /must be a URL for GIF, JPG or PNG/
    end
  end
end