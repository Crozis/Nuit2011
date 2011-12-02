require 'spec_helper'

describe "products/show.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :description => "Description",
      :price => 1.5,
      :image_url_big => "Image Url Big",
      :image_url_small => "Image Url Small",
      :deeplink => "Deeplink"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Url Big/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Url Small/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Deeplink/)
  end
end
