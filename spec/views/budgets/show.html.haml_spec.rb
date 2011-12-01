require 'spec_helper'

describe "budgets/show.html.haml" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :user_id => 1,
      :event_id => 1,
      :amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
