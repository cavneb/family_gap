class AddAdditionalFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorization_code, :string
    add_column :users, :access_token, :string
    add_column :users, :links, :json
    add_column :users, :contact_name, :string
    add_column :users, :helper_access_pin, :string
    add_column :users, :given_name, :string
    add_column :users, :family_name, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :country, :string
    add_column :users, :preferred_language, :string
    add_column :users, :display_name, :string
    add_column :users, :person_id, :string
    add_column :users, :tree_user_id, :string
  end
end
