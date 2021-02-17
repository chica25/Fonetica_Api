class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.string :english_phrase
      t.string :foreign_phrase
      t.integer :language_id

      t.timestamps
    end
  end
end
