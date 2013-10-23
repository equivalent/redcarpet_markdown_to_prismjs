require 'nokogiri'
require 'redcarpet'
require "redcarpet_markdown_to_prismjs/version"
require "redcarpet_markdown_to_prismjs/content_constructor"
require "redcarpet_markdown_to_prismjs/parser"


module RedcarpetMarkdownToPrismjs
  def to_prism_html
    RedcarpetMarkdownToPrismjs::Parser.new(self).parse
  end
end

String.send :include, RedcarpetMarkdownToPrismjs



