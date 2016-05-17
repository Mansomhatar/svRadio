class Channel
  attr_accessor :id
  attr_accessor :name
  attr_accessor :image
  attr_accessor :imagetemplate
  attr_accessor :color
  attr_accessor :tagline
  attr_accessor :siteurl
  attr_accessor :liveaudio_id
  attr_accessor :liveaudio_url
  attr_accessor :liveaudio_statkey
  attr_accessor :scheduleurl
  attr_accessor :channeltype
  attr_accessor :xmltvid

  def initialize (node)
    @id = node.attributes["id"]
    @name = node.attributes["name"]
    @image = node.css("image").map(&:text)[0]
    @image = node.css("imagetemplate").map(&:text)[0]
    @color = node.css("color").map(&:text)[0]
    @tagline = node.css("tagline").map(&:text)[0]
    @siteurl = node.css("siteurl").map(&:text)[0]
    @live_audio_section = node.css("liveaudio")[0]
    @liveaudio_id = @live_audio_section.attributes["id"]
    @liveaudio_url = @live_audio_section.css("url").map(&:text)[0]
    @liveaudio_statkey = @live_audio_section.css("url").map(&:text)[0]
    @scheduleurl = node.css("scheduleurl").map(&:text)[0]
    @channeltype = node.css("channeltype").map(&:text)[0]
    @xmltvid = node.css("xmltvid").map(&:text)[0]
  end
end