class AddCityAndCountryAndLatitudeAndLongitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
