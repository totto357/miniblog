require "rails_helper"

RSpec.feature "Home", type: :system, js: true do
  scenario "ホーム画面が表示される" do
    visit root_path
    expect(page).to have_content "Home#index"
  end
end
