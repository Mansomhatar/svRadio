#! /usr/bin/ruby
#! -*- coding: utf-8 -*-

require_relative 'get_url.rb'
require_relative 'channel.rb'
require_relative 'pagination.rb'
require 'nokogiri'

def get_channel(current_page, channels_array, xml_file = nil, json_file = nil)

  html_data = GetURL.new(current_page).getHTML
  doc = Nokogiri::XML.parse(html_data)
  pg = Pagination.new(doc);
  channels = doc.css("channels").css("channel")
  channels.each do |node|

    if !xml_file.nil? then
      xml_file.puts (node)
    end

    current_channel = Channel.new(node);
    channels_array << current_channel
  end
  return  pg.nextpage

end

def create_html_players_list(channels, fileName)

  htmlFile = File.new(fileName, 'a+')

  channels.each do |channel|
    htmlFile.puts('<article class="playerArticle">')
    htmlFile.puts('<img src="' + channel.image + '">')
    htmlFile.puts('<audio id="' + channel.id + '" controls>')
    htmlFile.puts('<source src="' + channel.liveaudio_url + '">')
    htmlFile.puts('</audio>')
    htmlFile.puts('</article>')
  end

  htmlFile.close
end

current_page = 'http://api.sr.se/api/v2/channels'
channels_array = Array.new
#xml_file = File.new('channels.xml', 'a+')
xml_file = nil

while !current_page.nil?
  current_page = get_channel(current_page, channels_array, xml_file)
end

if !xml_file.nil? then xml_file.close end


create_html_players_list(channels_array, playerList.html)






