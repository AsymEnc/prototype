class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :docid
      t.string :title
      t.string :fulltext
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
