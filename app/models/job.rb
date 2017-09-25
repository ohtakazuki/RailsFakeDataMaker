class Job < ApplicationRecord
  enum format: { CSV: 0, TSV: 1 }
  enum char_code: { 'utf-8': 0, 'Shift_JIS': 1 }
end
