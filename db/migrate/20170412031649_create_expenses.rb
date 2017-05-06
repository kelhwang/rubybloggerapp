class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :vendor
      t.numeric :amount
      t.text :description

      t.timestamps
    end
  end
end
