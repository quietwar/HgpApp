require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!())
  end

  it "renders the edit event form" do
    render

<<<<<<< HEAD
    assert_select "form[action=?][method=?]", events_1_edit_path(@event), "post" do
=======
    assert_select "form[action=?][method=?]", events_1_path(@events), "post" do
>>>>>>> 953703d3ca0a5d21984e53c1d444c50ab07d2b44
    end
  end
end
