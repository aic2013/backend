class AIC13::Ads < Grape::API
  resource :ads do
    desc "Returns random ad for user"
    get ':id' do
      keyword = Person.random_topic_for_user(params[:id])
      ad = Ad.where(keywords: keyword).first

      if ad
        { ads: [id: ad[:id], title: ad[:title], description: ad[:description], image_url: ad[:image_url]]}
      else
        {}
      end
    end
  end
end
