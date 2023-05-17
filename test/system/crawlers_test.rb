require "application_system_test_case"

class CrawlersTest < ApplicationSystemTestCase
  setup do
    @crawler = crawlers(:first)
  end

  test "Creating a new crawler" do
    visit crawlers_path
    assert_selector "h1", text: "Crawlers"

    click_on "New Crawler"
    assert_selector "h1", text: "New crawler"

    fill_in "Keywords", with: "Keywords 1"
    select "Google", from: "crawler_drivers"

    click_on "Create Crawler"

    assert_selector "h1", text: "Crawlers"
    assert_text "Keywords 1"
  end

  test "Showing a crawler" do
    visit crawlers_path
    click_link @crawler.keywords

    assert_selector "h1", text: @crawler.keywords
  end

  test "Updating a crawler" do
    visit crawlers_path
    assert_selector "h1", text: "Crawlers"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit crawler"

    fill_in "Keywords", with: "Updated crawler"
    click_on "Update Crawler"

    assert_selector "h1", text: "Crawlers"
    assert_text "Updated crawler"
  end

  test "Destroying a crawler" do
    visit crawlers_path
    assert_text @crawler.keywords

    click_on "Delete", match: :first
    assert_no_text @crawler.keywords
  end
end
