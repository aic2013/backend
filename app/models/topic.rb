class Topic

  def initialize(node)
    @node = node
  end

  def self.find(keywords)
    node = Neography::Node.new(NEO4J.find_nodes_labeled('Topic', { keywords: keywords }).first)
    new(node) if node.neo_id
  end

  def interested_users
    nodes = NEO4J.execute_query "START t = node(#{@node.neo_id}) MATCH (u)-[r]->(t) RETURN u"
    TwitterUser.where(id: nodes['data'].map { |u| u.first['data']['id'] })
  end

end