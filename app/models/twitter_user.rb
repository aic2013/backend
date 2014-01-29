class TwitterUser < ActiveRecord::Base
  self.table_name = 'twitteruser'
  self.primary_key = 'id'
end
