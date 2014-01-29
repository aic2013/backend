class Ad
  include Mongoid::Document

  field title: String
  field description: String
  field image_url: String

  field keywords: Array
end