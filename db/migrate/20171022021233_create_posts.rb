class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      
      t.string :title
      t.text   :markdown
      t.text   :html

      t.timestamps
    end
  end
end
