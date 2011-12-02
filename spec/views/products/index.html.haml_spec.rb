require 'spec_helper'

describe "products/index.html.haml" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :description => "Description",
        :price => 1.5,
        :image_url_big => "Image Url Big",
        :image_url_small => "Image Url Small",
        :deeplink => "Deeplink"
      ),
      stub_model(Product,
        :name => "Name",
        :description => "Description",
        :price => 1.5,
        :image_url_big => "Image Url Big",
        :image_url_small => "Image Url Small",
        :deeplink => "Deeplink"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Url Big".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Url Small".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Deeplink".to_s, :count => 2
  end
end
