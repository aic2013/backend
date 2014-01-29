class Person

  def self.find(id)
    NEO4J.get_nodes_labeled('Person', { id: id })
  end

  def profile
    TwitterUser.find_by(id: id)
  end
end