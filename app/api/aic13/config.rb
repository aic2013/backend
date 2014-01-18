class AIC13::Config < Grape::API
  resource :config do
    desc "Returns valid connection types for further use"
    get :connection_types do
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
      optional :depth, type: Integer, desc: 'Search depth. Default: 2 (Friends of friends)'
    end
    post :ads do

    end
  end
end