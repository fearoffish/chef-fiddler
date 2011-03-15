module ChefFiddler
  class Control
    def self.get_clusters(filter="name:*" , options={})
      search = ChefFiddler::Search.new(options)
      results = search.get_clusters(filter)

      results
    end
  end
end