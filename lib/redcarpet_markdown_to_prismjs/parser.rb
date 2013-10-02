class RedcarpetMarkdownToPrismjs::Parser
  attr_reader :content

  def self.markdown
    ::Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(),
      :autolink => true,
      :space_after_headers => true,
      no_intra_emphasis: true,
      fenced_code_blocks: true
    )
  end

  def initialize(content)
    @content = content
    self
  end

  def html_from_markdown
    RedcarpetMarkdownToPrismjs::Parser.markdown.render(content)
  end

  def parse
    content_constructor.body
  end

  def content_constructor
    RedcarpetMarkdownToPrismjs::ContentConstructor.new(html_from_markdown)
  end

end
