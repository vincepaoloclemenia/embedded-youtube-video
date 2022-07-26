class AddYoutubeIdToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :youtube_id, :string, null: false
  end
end
