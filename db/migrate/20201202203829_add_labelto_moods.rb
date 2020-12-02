class AddLabeltoMoods < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :label, :string
  end
end
