# frozen_string_literal: true

class DeviseCreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price_upper_limit, null: false
      t.integer :price_lower_limit, null: false
      t.text :hp_url
      t.integer :reservation_method, null: false
      t.string :phone_number, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.time :opening_time, null: false
      t.time :closing_time, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :restaurants, :email,                unique: true
    add_index :restaurants, :reset_password_token, unique: true
    # add_index :restaurants, :confirmation_token,   unique: true
    # add_index :restaurants, :unlock_token,         unique: true
  end
end
