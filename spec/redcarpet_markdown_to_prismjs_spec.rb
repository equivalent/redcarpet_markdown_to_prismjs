require 'spec_helper'

class Foo
  include RedcarpetMarkdownToPrismjs
end

describe Foo do
  let(:instance){ Foo.new }
  let(:parser)  { double :parser }
  it do
    parser.should_receive(:parse)

    RedcarpetMarkdownToPrismjs::Parser.
      should_receive(:new).
      with('my string').
      and_return(parser)

    instance.prism_html("my string")
  end
end
