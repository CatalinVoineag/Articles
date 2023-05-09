require "rails_helper"

RSpec.describe "User can likes articles", js: true do
  scenario "user likes articles" do
    files = ArticleFile.new({ small: "small_test_image.jpg" })
    images = [
      Image.new(
        {
          files: files
        }
      )
    ]
    article_1 = Article.new(
      {
        title: "Article 1",
        id: 1,
        likes: 0,
        images: images
      }
    )

    article_2 = Article.new(
      {
        title: "Article 2",
        id: 2,
        likes: 0,
        images: images
      }
    )
    articles = [article_1, article_2]

    allow_any_instance_of(ArticleService).to receive(:get).and_return(
      articles
    )

    visit root_path

    # test first article
    within "#article_#{article_1.id}" do
      expect(page).to have_text article_1.title
      expect(page).to have_css("img")
      expect(page).to have_text "Likes 0"
    end

    within "#article_#{article_1.id}" do
      click_button "Like"

      expect(page).to have_text "Likes 1"
    end

    # test second article
    within "#article_#{article_2.id}" do
      expect(page).to have_text article_2.title
      expect(page).to have_css("img")
      expect(page).to have_text "Likes 0"
    end

    within "#article_#{article_2.id}" do
      click_button "Like"

      expect(page).to have_text "Likes 1"
    end
  end
end
