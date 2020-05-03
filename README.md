# Utranslate
A very easy to use and configure gem to add I18n support to Activerecord models using postgresql JSONB columns.

# Usage

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'utranslate'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install utranslate
```

## Configuration

Include utranslate in all the models that you want to translate:

```ruby
class Post
  include Utranslate
end
```

Add translations for every attribute that you want to translate.

```ruby
translate :title
```

You can specify to check for presence of all I18n.available_locales

```ruby
translate :title, null: false
```

Or you can define what locales you want to check

```ruby
translate :title, null: false, locales: [:es, :en]
```

## Adding a translation for current locale

To add a translation for current locale you just have to assign as usual

```ruby
post.title = 'translation'
```

## Adding a translation for a given locale

To add a translation for a given locale you must pass the locale and the translation

```ruby
post.title(:es, 'traducción')
```

## Mass assigning translations

To mass assign translations you can do it as usual

```ruby
post = Post.new(title: { es: 'traducción', en: 'translation'})
```

## Retriving a translation for current locale

To retrive a translation for current locale you can do it as usual

```ruby
post.title
```

## Retriving a translation for given locale

To retrive a translation for current locale you can do it as usual

```ruby
post.title(:es)
```

## Contributing
Feel free to contribute to this project or to contact me through klatooine@gmail.com

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
