require "rails_helper"

RSpec.feature "Home", type: :system, js: true do
  scenario "フォームが表示されている" do
    visit root_path
    expect(page).to have_selector "#new_status"
  end

  context "投稿が0件のとき" do
    scenario "投稿がない旨が表示されてる" do
      visit root_path
      expect(page).to have_content "投稿がありません。"
    end

    scenario "投稿すると投稿のない旨が消える" do
      visit root_path
      fill_in "status_text", with: "テキスト"
      click_button "投稿する"
      expect(page).to have_content "テキスト"
      expect(page).to have_no_content "投稿がありません。"
    end
  end

  context "投稿が1件以上のとき" do
    let!(:status1) { create(:status, text: "テキスト1", created_at: "2000/01/01 00:00:00") }
    let!(:status2) { create(:status, text: "テキスト2") }

    scenario "リストが表示されている" do
      visit root_path
      expect(page).to have_selector ".status", count: 2
      expect(page).to have_content "テキスト1"
      expect(page).to have_content "2000/01/01 00:00"
    end

    scenario "テキストなしで投稿するとトーストが表示される" do
      visit root_path
      click_button "投稿する"
      expect(page).to have_selector "#toast-container", text: "テキストを入力してください"
    end

    scenario "正しい投稿をすると1件増える" do
      visit root_path
      fill_in "status_text", with: "テキスト3"
      click_button "投稿する"
      expect(page).to have_content "テキスト3"
      expect(Status.count).to eq 3
    end
  end
end
