class AIC13::Users < Grape::API
  resource :users do
    desc "Returns valid connection types for further use"
    params do
      required :topics, type: Array, desc: 'List of topic names'
      optional :depth, type: Integer, desc: 'Search depth. Default: 2 (Friends of friends)'
    end
    get :topics do
      [
        { key: 'follows', value: 'Follows' },
        { key: 'friends', value: 'Friends' },
        { key: 'favorites', value: 'Favorites' },
        { key: 'tweets', value: 'Tweets' },
        { key: 'retweets', value: 'Retweets' }
      ]
    end

    desc 'Configures variables for determining interesting ads'
    params do
      optional :connection_types, type: Array, desc: 'List of types to consider. Default: all'
      optional :min_range, type: Float, desc: 'Minimum topic variety. Default: 0.0'
      optional :max_range, type: Float, desc: 'Maximum topic variety. Default: 1.0'
      optional :depth, type: Integer, desc: 'Search depth. Default: 2 (Friends of friends)'
    end
    get :suggestions do

    end
  end
end