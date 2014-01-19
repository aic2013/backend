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
      users = ::Kaminari::PaginatableArray.new User.fake_user_data

      paginate(users)
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
      users = ::Kaminari::PaginatableArray.new User.fake_user_data

      paginate(users)
    end
  end
end