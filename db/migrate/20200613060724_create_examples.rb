class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.string :sentence
      t.belongs_to :vocab 
      
      t.timestamps
    end
  end
end
