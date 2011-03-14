module ChefFiddler
  class Control
    def self.get_clusters
      search = ChefFiddler::Search.new
      results = search.get_clusters

      results
    end
  end
end