class Document < ActiveRecord::Base
  searchable do
    text :fulltext
  end
end
