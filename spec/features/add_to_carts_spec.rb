require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see one product added to cart" do
    # ACT
    visit root_path
    product = page.first("article.product")
    my_cart = product.first("footer a")
    my_cart.click


    # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_text('My Cart (1)')
  end
end
