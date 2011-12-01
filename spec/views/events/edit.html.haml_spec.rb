require 'spec_helper'

describe "events/edit.html.haml" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :creator_id => 1,
      :victim => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_creator_id", :name => "event[creator_id]"
      assert_select "input#event_victim", :name => "event[victim]"
      assert_select "textarea#event_description", :name => "event[description]"
    end
  end
end