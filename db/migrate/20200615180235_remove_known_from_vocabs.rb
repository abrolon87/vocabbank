class RemoveKnownFromVocabs < ActiveRecord::Migration[6.0]
  def change
    remove_column :vocabs, :known, :boolean
  end
end
