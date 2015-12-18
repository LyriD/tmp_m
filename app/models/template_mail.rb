# == Schema Information
#
# Table name: template_mails
#
#  id         :integer          not null, primary key
#  name       :string
#  theme      :string
#  period     :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  bcc        :string
#

class TemplateMail < ActiveRecord::Base
  enum period: [ :month, :week, :after ]

  has_and_belongs_to_many :offerings

  def self.for_subscription(offering_id, period_name)
    result = TemplateMail.send(period_name)
              .joins(:offerings)
              .where(offerings: { offering_id: offering_id })
              .order(created_at: :desc)
              .first
    return result if result.present?

    # если не нашли, ищем без указанного offering, т.е. общий
    TemplateMail.send(period_name)
        .includes(:offerings)
        .where(offerings: { offering_id: nil })
        .order(created_at: :desc)
        .first
  end
end
