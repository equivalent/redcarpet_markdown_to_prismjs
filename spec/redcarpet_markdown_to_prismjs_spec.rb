require 'spec_helper'

describe 'RedcarpetMarkdownToPrismjs' do
  let(:parser){double :parser}
  it do
    parser.should_receive(:parse)
    RedcarpetMarkdownToPrismjs::Parser.should_receive(:new).with('my string').and_return(parser)
    "my string".to_prism_html
  end
end
