module TVInfo
  class Episode
    attr_reader :id, :name, :description, :first_aired, :season, :episode, :show

    def initialize(id, name, first_aired, season, episode, description, show_name)
      @id = id
      @name = name
      @first_aired = first_aired
      @season = season
      @episode = episode
      @description = description
      @show_name = show_name
    end

    def self.from_XML(xml, show_name)
      id = xml.at_css("id").text.to_i
      name = xml.at_css("episodename").text
      first_aired = Date.parse(xml.at_css("firstaired").text) unless xml.at_css("firstaired").text.empty?
      season = xml.at_css("seasonnumber").text.to_i
      episode = xml.at_css("episodenumber").text.to_i
      description = xml.at_css("overview").text

      Episode.new(id, name, first_aired, season, episode, description, show_name)
    end

    def to_s
      <<DAV
BEGIN:VCALENDAR
PRODID:tvinfo
VERSION:2.0
BEGIN:VEVENT
UID:#{@id}
SUMMARY:#{@show_name} S#{'%02d' % @season}E#{'%02d' % @episode}: #{@name}
DESCRIPTION:#{@description.gsub("\n", " ")}
DTSTART;VALUE=DATE:#{@first_aired.strftime('%Y%m%d') if @first_aired}
DTEND;VALUE=DATE:#{@first_aired.strftime('%Y%m%d') if @first_aired}
END:VEVENT
END:VCALENDAR
DAV
    end
  end
end
