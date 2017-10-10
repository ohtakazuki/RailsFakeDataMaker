class Job < ApplicationRecord
  has_many :columns, dependent: :destroy
  accepts_nested_attributes_for :columns,
                                reject_if: :reject_name_empty,
                                allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }

  enum format: { CSV: 0, TSV: 1 }
  enum char_code: { 'utf-8': 0, 'Shift_JIS': 1 }

  # nameが空白の行は保存しない（存在していれば削除）
  def reject_name_empty(attributes)
    exists = attributes[:id].present?
    empty = attributes[:name].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
end
