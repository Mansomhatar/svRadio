require 'net/http'

class GetURL

  def initialize (uri)
    @uri = URI(uri)
  end

  def getHTML
    @res =''
    begin
      @res = Net::HTTP.get(@uri)
      rescue => err
        puts ("Error: #{err.class}: #{err.message}")
    end
    return @res
  end

end