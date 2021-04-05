require 'rails_helper'

RSpec.describe Tracking, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'validatios' do
    it "la guia no debe estar en blanco" do
      guia = Tracking.new(guia: "").save
      expect(guia).to eq(false)
    end
  end
end
