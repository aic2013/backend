class API < Grape::API
  version 'v1', using: :header, vendor: 'aic13'
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  mount AIC13::Ads
  mount AIC13::Config
  mount AIC13::Users
end