class API < Grape::API
  version 'v1', using: :header, vendor: 'aic13'
  format :json

  # Cross-Origin Resource Sharing
  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount AIC13::Config
  mount AIC13::Users

  # Documentation
  add_swagger_documentation({ markdown: true })
end