require 'spec_helper'

describe "work_cards/new" do
  before(:each) do
    assign(:work_card, stub_model(WorkCard,
      :start_at => "",
      :end_at => "",
      :pause => ""
    ).as_new_record)
  end

  it "renders new work_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_cards_path, "post" do
      assert_select "input#work_card_start_at[name=?]", "work_card[start_at]"
      assert_select "input#work_card_end_at[name=?]", "work_card[end_at]"
      assert_select "input#work_card_pause[name=?]", "work_card[pause]"
    end
  end
end
