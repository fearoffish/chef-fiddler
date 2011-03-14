module ChefFiddler
  class Control
    def self.get_clusters(options={})
      search = ChefFiddler::Search.new(options)
      results = search.get_clusters("", options)

      results
    end
  end
end