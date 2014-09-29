class Todolist < ActiveRecord::Base
validates :todolist_name, presence: true
belongs_to :user
has_many :tasks
end
