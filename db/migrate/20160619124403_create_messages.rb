class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.string :references
      t.string :text
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
