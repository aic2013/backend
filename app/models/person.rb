class Person

  def self.find(id)
    NEO4J.get_nodes_labeled('Person', { id: id })
  end

  def self.random_topic_for_user(user_id)
    nodes = NEO4J.execute_query "MATCH (p:Person {id: 389010308}) MATCH p-[r*1..3]->(t:Topic) RETURN t"
    nodes['data'].map { |u| u.first['data']['keywords'] }.reject { |e| e.size > 1 }.shuffle.first
  end

  def profile
    TwitterUser.find_by(id: id)
  end
end