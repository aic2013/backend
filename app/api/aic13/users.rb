class AIC13::Users < Grape::API
  include Grape::Kaminari

  resource :users do
    paginate per_page: 20

    desc "Returns valid connection types for further use"
    params do
      requires :topics, type: Array, desc: 'List of topic names'
      optional :depth, type: Integer, desc: 'Search depth. Default: 2 (Friends of friends)'
      optional :page, type: Integer, desc: 'Page'
    end
    get :topics do
      users = Topic.interested_users(params[:topics], params[:depth] || 2)
      if users.empty?
        {}
      else
        paginate users
      end
    end

    desc 'Configures variables for determining interesting ads'
    params do
      optional :connection_types, type: Array, desc: 'List of types to consider. Default: all'
      optional :min_range, type: Float, desc: 'Minimum topic variety. Default: 0.0'
      optional :max_range, type: Float, desc: 'Maximum topic variety. Default: 1.0'
      optional :depth, type: Integer, desc: 'Search depth. Default: 2 (Friends of friends)'
      optional :page, type: Integer, desc: 'Page'
    end
    get :suggestions do
      nodes = NEO4J.execute_query "START n = node(*) MATCH u-[f:FOLLOWS]->n-[r]->(t:Topic) WITH n, COUNT(f) AS foll, SUM(r.count) AS rs, COUNT(r) as rc WHERE rs > 0 AND (rc/rs) > #{params[:min_range] || 0.0} AND (rc/rs) < #{params[:max_range] || 1.0} RETURN n, rc, rs, (rc/rs), foll ORDER BY foll DESC LIMIT 100"

      paginate TwitterUser.where(id: nodes['data'].map { |u| u.first['data']['id'] })
    end
  end
end