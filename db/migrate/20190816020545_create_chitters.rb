class CreateChitters < ActiveRecord::Migration[5.2]
  def change
    create_table :chitters do |t|
      t.text :tweet
    end
  end
end
