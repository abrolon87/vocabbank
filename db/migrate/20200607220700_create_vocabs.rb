class CreateVocabs < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabs do |t|
      t.string :word_or_phrase 
      t.string :translation
      t.belongs_to :language 
      t.belongs_to :user
      t.boolean :known, default: false 

      t.timestamps
    end
  end
end
