class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :channel, index: true, foreign_key: true, null: false
      t.string :text, null: false
      t.datetime :published_at, index: true, null: false

      t.timestamps null: false
    end
  end
end
