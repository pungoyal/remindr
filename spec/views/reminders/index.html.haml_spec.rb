require 'spec_helper'

describe "reminders/index.html.haml" do
  before(:each) do
    assign(:reminders, [
      stub_model(Reminder,
        :content => "Content",
        :twitter_handle => "Twitter Handle",
        :dm => false
      ),
      stub_model(Reminder,
        :content => "Content",
        :twitter_handle => "Twitter Handle",
        :dm => false
      )
    ])
  end

  it "renders a list of reminders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Twitter Handle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
