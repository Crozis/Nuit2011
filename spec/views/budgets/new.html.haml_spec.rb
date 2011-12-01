require 'spec_helper'

describe "budgets/new.html.haml" do
  before(:each) do
    assign(:budget, stub_model(Budget,
      :user_id => 1,
      :event_id => 1,
      :amount => 1.5
    ).as_new_record)
  end

  it "renders new budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => budgets_path, :method => "post" do
      assert_select "input#budget_user_id", :name => "budget[user_id]"
      assert_select "input#budget_event_id", :name => "budget[event_id]"
      assert_select "input#budget_amount", :name => "budget[amount]"
    end
  end
end
