require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      :model => "Model",
      :color => "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Color/)
  end
end
