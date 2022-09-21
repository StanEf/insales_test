def check_html_dom(str)
  str.gsub(%r{<[/]?(b|i|(em)|p|(div))>}).each_with_object([]) do |tag, levels|
    tag_type = tag.match(/[a-z]+/)[0]
    tag_closing = tag.include? '/'
    if tag_closing && levels.last == tag_type
      levels.pop
    elsif tag_closing && levels.last != tag_type
      return levels.pop
    else
      levels.push(tag_type)
    end
  end

  true
end

str1 = '<div><b><p>hello world</p></b></div>'
str2 = '<div><i>hello</i>world</b>'
str3 = '<div><i>hello</i><p><b>world</b></em></div>'

p check_html_dom(str1)
p check_html_dom(str2) == 'div'
p check_html_dom(str3) == 'p'
