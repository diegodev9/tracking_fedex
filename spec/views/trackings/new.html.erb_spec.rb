require 'rails_helper'

RSpec.describe "trackings/new", type: :view do
  before(:each) do
    assign(:tracking, Tracking.new(
      nombre: "MyString",
      guia: "MyString",
      estado: "MyString",
      descripcion: "MyString"
    ))
  end

  it "renders new tracking form" do
    render

    assert_select "form[action=?][method=?]", trackings_path, "post" do

      assert_select "input[name=?]", "tracking[nombre]"

      assert_select "input[name=?]", "tracking[guia]"

      assert_select "input[name=?]", "tracking[estado]"

      assert_select "input[name=?]", "tracking[descripcion]"
    end
  end
end
