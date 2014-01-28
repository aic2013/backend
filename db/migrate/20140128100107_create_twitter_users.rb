class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitteruser, id: false do |t|
      t.integer :id,              limit: 8
      t.integer :favouritescount
      t.integer :followerscount
      t.integer :friendscount
      t.string  :lang
      t.integer :listedcount
      t.string  :name
      t.string  :screenname
      t.integer :statusescount
    end
  end
end
