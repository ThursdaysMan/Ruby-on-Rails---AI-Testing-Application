class CreateExampleModels < ActiveRecord::Migration[7.2]
  def change
    create_table :example_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
