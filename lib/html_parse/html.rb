class HtmlParse

  def parse_machine_result

    url = "http://papimo.jp/h/00031715/hit/view/600"

    body = Net::HTTP.get(url)
    p body
  end

end
