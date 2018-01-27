# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:task) do
      Integer :task_id, auto_increment: true, primary_key: true
      String :user, index: true, size: 40
      String :description, null: false, size: 100
      TrueClass :status, null: false, default: false
    end
  end
end
