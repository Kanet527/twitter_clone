class CreateTwClones < ActiveRecord::Migration[5.1]
  def change
    create_table :tw_clones do |t|
      t.string :content
      t.timestamps
    end
  end
end
