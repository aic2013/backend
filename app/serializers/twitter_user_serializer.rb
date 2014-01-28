class TwitterUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :screen_name, :favorite_count, :friend_count,
     :follower_count, :status_count, :listed_count

  def favorite_count
    object.favouritescount
  end

  def friend_count
    object.friendscount
  end

  def follower_count
    object.followerscount
  end

  def status_count
    object.statusescount
  end

  def listed_count
    object.listedcount
  end

  def screen_name
    object.screenname
  end

  def language
    object.lang
  end
end
