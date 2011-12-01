require 'spec_helper'

describe "budgets/index.html.haml" do
  before(:each) do
    assign(:budgets, [
      stub_model(Budget,
        :user_id => 1,
        :event_id => 1,
        :amount => 1.5
      ),
      stub_model(Budget,
        :user_id => 1,
        :event_id => 1,
        :amount => 1.5
      )
    ])
  end

  it "renders a list of budgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
