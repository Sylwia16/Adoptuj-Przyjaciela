class Adoption < ApplicationRecord
  belongs_to :user
  belongs_to :dog, optional: true
  belongs_to :cat, optional: true

  validates :user_id, uniqueness: { scope: :dog_id, message: 'can only adopt the same dog once' }, if: :dog
  validates :user_id, uniqueness: { scope: :cat_id, message: 'can only adopt the same cat once' }, if: :cat

  private

  def either_dog_or_cat
    if dog_id.blank? && cat_id.blank?
      errors.add(:base, 'Musisz wybrać psa lub kota do adopcji.')
    elsif dog_id.present? && cat_id.present?
      errors.add(:base, 'Nie możesz wybrać psa i kota jednocześnie.')
    end
  end
end
