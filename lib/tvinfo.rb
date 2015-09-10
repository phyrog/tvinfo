require "tvinfo/version"
require "tvinfo/show"
require "yaml"
require "open-uri-and-write"

module TVInfo
  class EpisodeGrabber
    def load_config_file(file)
      YAML.load_file(file)
    end

    def fetch_shows(config)
      config["shows"].map { |show| Show.new(show, config) }
    end

    def grab
      @config = load_config_file("#{Dir.home}/.config/tvinfo/config.yml")
      @shows = fetch_shows(@config)

      @shows.each do |show|
        show.episodes.each do |episode|
          path = URI.join(@config["caldav"]["url"], "#{episode.id}.ics").to_s
          caldav_config = @config["caldav"].map { |k, v| { k.to_sym => v } }.inject(&:merge)
          open(path, "w", caldav_config) do |file|
            file.puts(episode.to_s)
          end
        end
      end
    end
  end
end
