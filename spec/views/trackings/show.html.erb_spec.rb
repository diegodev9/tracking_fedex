require 'rails_helper'

RSpec.describe "trackings/show", type: :view do
  before(:each) do
    @tracking = assign(:tracking, Tracking.create!(
      nombre: "Nombre",
      guia: "Guia",
      estado: "Estado",
      descripcion: "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Guia/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Descripcion/)
  end
end
