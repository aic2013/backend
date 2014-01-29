Neography.configure do |config|
  config.server         = "graph.aic13.mmuehlberger.com"
  config.log_enabled    = false
end

NEO4J = Neography::Rest.new