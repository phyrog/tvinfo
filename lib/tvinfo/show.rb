require "nokogiri"
require "open-uri"
require "tvinfo/episode"

module TVInfo
  class Show
    attr_reader :name, :id, :episodes

    def initialize(show_name_or_id, config)
      @config = config

      if show_name_or_id.to_i.to_s == show_name_or_id
        @id = show_name_or_id.to_i
      else
        @id = fetch_id(show_name_or_id).to_i
      end

      fetch_series_info
      filter_episodes
    end
    
    def fetch_id(name)
      series = Nokogiri::HTML(open("http://thetvdb.com/api/GetSeries.php?seriesname=#{name}"))
      series.at_css("series id").text
    end

    def fetch_series_info
      series = Nokogiri::HTML(open("http://thetvdb.com/api/#{@config["api_key"]}/series/#{@id}/all"))
      @name = series.at_css("seriesname").text

      @episodes = series.css("episode").map do |episode|
        Episode.from_XML(episode, @name)
      end
    end

    def filter_episodes
      if @config["skip_tba_episodes"]
        @episodes.delete_if { |ep| ep.first_aired.nil? || ep.name.empty? }
      end

      if @config["skip_past_episodes"]
        @episodes.delete_if { |ep| ep.first_aired < Date::today }
      end
    end
  end
end
