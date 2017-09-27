class Column < ApplicationRecord
  belongs_to :job
  enum data_type: { 'Faker': 0, 'Other1': 1, 'Other2': 2 }
end
