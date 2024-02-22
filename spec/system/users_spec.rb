require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:playwright)
  end

  it "creates a User" do
    visit new_user_path
    Capybara.current_session.driver.with_playwright_page do |page|
      page.wait_for_load_state(state: 'networkidle')
      sleep 30
      expect(page).to have_content("User was successfully created.")
    end
  end
end
