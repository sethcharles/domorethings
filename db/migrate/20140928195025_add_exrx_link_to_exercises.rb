class AddExrxLinkToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :exrx_url, :string
  end
end
