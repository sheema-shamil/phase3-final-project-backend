ActiveRecord::Schema.define(version: 2022_01_01_141515) do
    create_table "categories", force: :cascade do |t|
      t.string "category" 
 end
 
 create_table "todos", force: :cascade do |t|
     t.string "item"
     t.string "importance"
     t.string "category_id"
   end
 
 end