require 'spec_helper'
describe RedcarpetMarkdownToPrismjs::Parser do
  include Capybara::RSpecMatchers
  include ExampleContent

  let(:ccp){ described_class.new(content) }

  describe 'parse content' do
    subject{ ccp.parse }

    context "when parsing code content" do
      let(:content){ content_with_code(lang) }

      context 'of ruby language' do
        let(:lang){'ruby'}

        it 'should generate code with class="language-ruby"' do
          should have_selector 'a[href="http://google.com"]', text: 'http://google.com'
          should have_selector 'pre > code.language-ruby'
        end

        it 'first line inside code element should start on new line' do
          should have_selector 'pre > code.language-ruby', text: /^\np "fourth line"/
        end

        it 'pre should have line-numbers class' do
          should have_selector 'pre.line-numbers > code.language-ruby'
        end

        it 'text should start on first line' do
          should have_selector 'pre > code' , text: /p "fourth line"/
        end
      end
    end

    context "when parsing fenced code block content" do
      let(:content){ content_with_fenced_code_block(lang) }

      context "ruby language" do
        let(:lang){'ruby'}
        it 'should generate code with language class"'  do
          should have_selector 'a[href="http://google.com"]', text: 'http://google.com'
          should have_selector 'pre > code.language-ruby'
        end
      end

      context "JavaScript language" do
        let(:lang){'java-script'}
        it 'should generate code with language class"'  do
          should have_selector 'a[href="http://google.com"]', text: 'http://google.com'
          should have_selector 'pre > code.language-java-script'
        end
      end

    end

    context "when parsing content without lang code" do
      let(:content){ content_without_lang_code }
      it 'should generate code without language class"'  do
        should have_selector 'a[href="http://google.com"]', text: 'http://google.com'
        should_not have_selector 'pre > code.ruby'
        should have_selector 'pre > code'
      end
    end

  end
end
