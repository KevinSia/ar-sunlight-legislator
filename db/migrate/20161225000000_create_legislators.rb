class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :title, :firstname, :middlename, :lastname, :name_suffix, :nickname, :party, :state, :gender, :phone, :fax, :district
      t.text :website
      t.date :birthday
      t.boolean :in_office
      t.timestamps null: false
    end
  end
end