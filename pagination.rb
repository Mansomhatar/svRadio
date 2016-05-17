require 'nokogiri'
class Pagination
  attr_reader :page, :totalhits, :totalpages, :size, :nextpage
  @page
  @size
  @totalhits
  @totalpages
  @nextpage

  def initialize (doc)
    @pagination_section = doc.css("pagination")

    @page = @pagination_section.css("page").map(&:text)[0].to_i
    @size = @pagination_section.css("size").map(&:text)[0].to_i
    @totalhits = @pagination_section.css("totalhits").map(&:text)[0].to_i
    @totalpages = @pagination_section.css("totalpages").map(&:text)[0].to_i
    @nextpage = @pagination_section.css("nextpage").map(&:text)[0]
  end
end