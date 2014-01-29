class Topic

  def initialize(node)
    @node = node
  end

  def self.interested_users(keywords, depth)
    nodes = NEO4J.execute_query "MATCH (t:Topic { keywords: #{keywords} }) MATCH (f:Person)-[r*..#{depth || 2}]->t RETURN f"
    TwitterUser.where(id: nodes['data'].map { |u| u.first['data']['id'] })
  end

end