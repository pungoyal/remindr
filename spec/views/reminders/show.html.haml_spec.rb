require 'spec_helper'

describe "reminders/show.html.haml" do
  before(:each) do
    @reminder = assign(:reminder, stub_model(Reminder,
      :content => "Content",
      :twitter_handle => "Twitter Handle",
      :dm => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Twitter Handle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
