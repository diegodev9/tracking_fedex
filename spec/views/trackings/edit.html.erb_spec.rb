require 'rails_helper'

RSpec.describe "trackings/edit", type: :view do
  before(:each) do
    @tracking = assign(:tracking, Tracking.create!(
      nombre: "MyString",
      guia: "MyString",
      estado: "MyString",
      descripcion: "MyString"
    ))
  end

  it "renders the edit tracking form" do
    render

    assert_select "form[action=?][method=?]", tracking_path(@tracking), "post" do

      assert_select "input[name=?]", "tracking[nombre]"

      assert_select "input[name=?]", "tracking[guia]"

      assert_select "input[name=?]", "tracking[estado]"

      assert_select "input[name=?]", "tracking[descripcion]"
    end
  end
end
