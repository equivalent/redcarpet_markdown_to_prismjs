module ExampleContent
  def content_with_fenced_code_block(lang)
<<-EOF
first line

```#{lang}
p "fourth line"
```

last line http://google.com
EOF
  end

  def content_with_code(lang)
<<-EOF
first line

    ### lang:#{lang}
    p "fourth line"

last line http://google.com
EOF
  end

  def content_without_lang_code
<<-EOF
first line

    p "fourth line"

last line http://google.com
EOF
  end
end
