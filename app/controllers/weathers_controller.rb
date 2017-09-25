class WeathersController < ApplicationController
  def index
    agent = Mechanize.new
    agent.request_headers = {
      'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
      'Accept-Encoding' => 'gzip, deflate',
      'Accept-Language' => 'ja,en-US;q=0.8,en;q=0.6',
      'Cache-Control' => 'no-cache',
      'Connection' => 'keep-alive',
      'Content-Length' => '486',
      'Content-Type' => 'application/x-www-form-urlencoded',
      'Host' => 'www.data.jma.go.jp',
      'Origin' => 'http://www.data.jma.go.jp',
      'Pragma' => 'no-cache',
      'Referer' => 'http://www.data.jma.go.jp/gmd/risk/obsdl/index.php',
      'Upgrade-Insecure-Requests' => '1',
      'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36',
    }

    content_data = {
      stationNumList: ["s47662"],
      aggrgPeriod: 9,
      elementNumList: [["201", ""]],
      interAnnualFlag: 1,
      ymdList: ["2017", "2017", "8", "9", "24", "24"],
      optionNumList: [],
      downloadFlag: "true",
      rmkFlag: 1,
      disconnectFlag: 1,
      youbiFlag: 0,
      fukenFlag: 0,
      kijiFlag: 0,
      huukouFlag: 0,
      csvFlag: 1,
      jikantaiFlag: 0,
      jikantaiList: [1, 24],
      ymdLiteral: 0,
      PHPSESSID: get_phpsessid
    }
    page = agent.post('http://www.data.jma.go.jp/gmd/risk/obsdl/show/table', content_data)
    render html: page.body
  end

  private
  
    def get_phpsessid
      url = "http://www.data.jma.go.jp/gmd/risk/obsdl/index.php"
      agent = Mechanize.new
      page = agent.get(url)
      return page.search('input#sid')[0]['value']
    end
end
