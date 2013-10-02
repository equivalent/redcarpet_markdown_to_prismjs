module RedcarpetMarkdownToPrismjs
  class ContentConstructor
    def initialize(html_from_markdown)
      @html_from_markdown = html_from_markdown
    end

    def body
      body = noko_doc.search("body")

      body.search("pre").each do |pre|

        pre.search("code").each do |code|
          if css_class = code.attributes['class'] # fenced code
            language_css_class(css_class.value)
            new_code_node.content = code.text
          elsif match = code.text.lines.first.match(/\#{3,6}[ ]?lang:[ ]?(\w*)\s?$/)
            language_css_class(match[1])
            new_code_node.content  = "\n#{ code.text.lines[1..-1].join}" # second till last line
          else
            new_code_node.content = code.text
          end
        end

        # nokogiri pre.content= "<code></code>" keeps striping tags, no solution
        pre.replace "<pre class=\"line-numbers\">#{new_code_node.to_html}</pre>"
      end
      body.inner_html.to_s
    end

    def language_css_class(lang)
      new_code_node['class'] = "language-#{lang}"  # language e.g.: "ruby"
    end

    def new_code_node
      @new_code_node ||= ::Nokogiri::XML::Node.new "code", noko_doc
    end

    def noko_doc
      @noko_doc ||= Nokogiri::HTML(@html_from_markdown)
    end
  end
end
