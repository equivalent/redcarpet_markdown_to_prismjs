require 'nokogiri'
require 'redcarpet'
require "redcarpet_markdown_to_prismjs/version"
require "redcarpet_markdown_to_prismjs/content_constructor"
require "redcarpet_markdown_to_prismjs/parser"

module RedcarpetMarkdownToPrismjs
  def prism_html(string)
    RedcarpetMarkdownToPrismjs::Parser.new(string).parse
  end
end
