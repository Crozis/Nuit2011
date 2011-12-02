require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :price => 1.5,
      :image_url_big => "MyString",
      :image_url_small => "MyString",
      :deeplink => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_image_url_big", :name => "product[image_url_big]"
      assert_select "input#product_image_url_small", :name => "product[image_url_small]"
      assert_select "input#product_deeplink", :name => "product[deeplink]"
    end
  end
end
