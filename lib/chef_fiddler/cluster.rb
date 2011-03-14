module ChefFiddler
  class Cluster
    attr_reader :name
    attr_accessor :nodes

    def initialize(data={})
      if data.has_key?(:name)
        @name = data[:name]
      end
      @nodes = []
    end

    def self.clusters_from_nodes(nodes, options={})
      clusters = []
      unique_cluster_envs = get_unique_cluster_names(nodes)
      unique_cluster_envs.each do |name|
        cluster_nodes = nodes.find_all do |node|
          name == node[:cluster_environment]
        end.sort_by {|node| node.name }

        cluster = Cloud::Cluster.new(:name => name)

        cluster_nodes.each do |data|
          cluster.nodes << Cloud::Node.new(data)
        end
        clusters << cluster
      end
      clusters
    end
    
    private
      def self.get_unique_cluster_names(nodes)
        nodes.collect {|node| node[:cluster_environment] }.uniq
      end
  end
end