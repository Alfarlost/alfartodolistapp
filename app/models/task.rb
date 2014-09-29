class Task < ActiveRecord::Base
validates :task_name, presence: true
validates :priority, presence: true
belongs_to :todolist

default_scope { order('priority DESC') }
 end
