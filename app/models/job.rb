class Job < ApplicationRecord
  has_many :columns, :dependent => :destroy
  accepts_nested_attributes_for :columns, :allow_destroy => true
  enum format: { CSV: 0, TSV: 1 }
  enum char_code: { 'utf-8': 0, 'Shift_JIS': 1 }
end
