# frozen_string_literal: true

class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings, &:timestamps
  end
end
