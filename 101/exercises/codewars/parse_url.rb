ALPHA = ('a'..'z').to_a

def domain_name(url)
  removed = nil
  chars = url.chars
  until removed == '/' || removed == '.'
    removed = chars.shift
  end
  until ALPHA.include?(chars[0])
    chars.shift
  end
  first_period_idx = chars.index('.')
  chars[0, first_period_idx].join
end


p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"