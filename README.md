# Getting Started

```
git clone git@github.com:CatalinVoineag/Articles.git articles
cd articles
bundle install
rake db:create && rake db:migrate
rspec # optional 
rails s
```

# Documentation
- This app needs to display a list of articles and allow the user to like an article. The likes need to be persistent between page loads. The articles are stored on a S3 bucket, so the articles are loaded on page load.

## Basic flow
- We first make an [api call](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/app/services/article_service.rb#L20) to the S3 bucket to get the articles.
- Once we have articles [we look for any likes](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/app/services/article_service.rb#L6-L12) records in our DB (a Like record holds the number of likes for an article, more details below)
- The articles with the number of likes are displayed on the view.
- The user can like an article, this will [create a new Like record or update an exiting one](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/app/controllers/likes_controller.rb#L3-L6).
- We then use turbo stream to update only a specific part of the page, the likes partial. Making a better experience for the user.

## What is a Like record?
- A like record is an [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html) table that holds a reference to an article, it's a bit like a [polimorphic table](https://guides.rubyonrails.org/association_basics.html#polymorphic-associations) but not linked with an Active Record table.
- [Like table schema](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/db/schema.rb#L14-L20)

## What is Turbo Stream?
- [Turbo streams](https://turbo.hotwired.dev/handbook/introduction) is rails way to make a page feel responsive and like a single page app. It basically sends html over the wire, [Hotwire](https://hotwired.dev/) to update only specific portions of a page. In this case we update an article's like counter by. We do this by responding to a post request in turbo stream [format](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/app/controllers/likes_controller.rb#L10-L12).
- This looks for a view called `create.turbo_stream.erb` and in this view we can tell rails what exactly to update.
- In our case we want to target the ["likes_#{article_id}"](https://github.com/CatalinVoineag/Articles/blob/6aa171aa50e544ad647692e503cd0830d9e0c780/app/views/likes/create.turbo_stream.erb#L1) html element and re-render the content inside that div with the updated content. 
- This allows us to update every article's like counter
