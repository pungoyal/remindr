require 'spec_helper'

describe "reminders/edit.html.haml" do
  before(:each) do
    @reminder = assign(:reminder, stub_model(Reminder,
      :content => "MyString",
      :twitter_handle => "MyString",
      :dm => false
    ))
  end

  it "renders the edit reminder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reminders_path(@reminder), :method => "post" do
      assert_select "input#reminder_content", :name => "reminder[content]"
      assert_select "input#reminder_twitter_handle", :name => "reminder[twitter_handle]"
      assert_select "input#reminder_dm", :name => "reminder[dm]"
    end
  end
end
