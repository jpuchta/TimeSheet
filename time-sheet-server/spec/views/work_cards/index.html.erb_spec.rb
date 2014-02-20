require 'spec_helper'

describe "work_cards/index" do
  before(:each) do
    assign(:work_cards, [
      stub_model(WorkCard,
        :start_at => "",
        :end_at => "",
        :pause => ""
      ),
      stub_model(WorkCard,
        :start_at => "",
        :end_at => "",
        :pause => ""
      )
    ])
  end

  it "renders a list of work_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 6
  end
end
