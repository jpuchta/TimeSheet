require 'spec_helper'

describe "work_cards/show" do
  before(:each) do
    @work_card = assign(:work_card, stub_model(WorkCard,
      :start_at => "",
      :end_at => "",
      :pause => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
