class DropExampleModels < ActiveRecord::Migration[7.2]
  def up
    drop_table :example_models
  end
end
