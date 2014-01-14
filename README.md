# RedcarpetMarkdownToPrismjs

Gem is a lazy solution to implement Redcarpet markdown so that it will
be recognized by Prism.js syntax highlight.

* https://github.com/vmg/redcarpet
* http://prismjs.com/

## Installation

Add this line to your application's Gemfile:

    gem 'redcarpet_markdown_to_prismjs', github: 'equivalent/redcarpet_markdown_to_prismjs'

And then execute:

    $ bundle

## Usage

```ruby
class Foo
  include RedcarpetMarkdownToPrismjs

  def some_string
    "my string"
  end
 
  def string_to_prism
    prism_html(some_string)
  end
end

foo =  Foo.new
foo.string_to_prism  #=> "<p>my string</p>"
```

or if you prefer it as a class method

```ruby
class Bar
  extend RedcarpetMarkdownToPrismjs

  def some_string
    "my string"
  end
 
  def string_to_prism
    Bar.prism_html(some_string)
  end
end

foo =  Foo.new
foo.string_to_prism  #=> "<p>my string</p>"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
