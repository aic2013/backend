class Topic

  def initialize(node)
    @node = node
  end

  def self.interested_users(keywords, depth)
    nodes = NEO4J.execute_query "MATCH (t:Topic { keywords: #{keywords} }) MATCH (f:Person)-->(u:Person)-->t RETURN f,u"
    TwitterUser.where(id: nodes['data'].map { |u| u.first['data']['id'] })
  end

end