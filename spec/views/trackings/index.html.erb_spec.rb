require 'rails_helper'

RSpec.describe "trackings/index", type: :view do
  before(:each) do
    assign(:trackings, [
      Tracking.create!(
        nombre: "Nombre",
        guia: "Guia",
        estado: "Estado",
        descripcion: "Descripcion"
      ),
      Tracking.create!(
        nombre: "Nombre",
        guia: "Guia",
        estado: "Estado",
        descripcion: "Descripcion"
      )
    ])
  end

  it "renders a list of trackings" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Guia".to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
  end
end
