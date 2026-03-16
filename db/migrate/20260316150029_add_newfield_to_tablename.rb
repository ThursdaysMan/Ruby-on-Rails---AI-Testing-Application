class AddNewfieldToTablename < ActiveRecord::Migration[7.2]
  def change
    add_column :example_models, :newfield, :string
  end
end
