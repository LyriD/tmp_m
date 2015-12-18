# == Schema Information
#
# Table name: feed_back_form_fields
#
#  id                :integer          not null, primary key
#  field_type        :integer
#  feed_back_form_id :integer
#  required          :boolean
#  placeholder       :string
#  position          :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class FeedBackFormField < ActiveRecord::Base
  belongs_to :feed_back_form

  validates :feed_back_form, :field_type, presence: true

  scope :ordered, -> { order(:position) }

  enum field_type: [
      :theme,
      :client_name,
      :email,
      :invoice_number,
      :company_name,
      :general_manager,
      :legal_address,
      :fact_address,
      :mail_address,
      :inn,
      :kpp,
      :phone,
      :bank_name,
      :bic,
      :correspondent_account,
      :checking_account,
      :body,
      :file
  ]

  def text_field?
    !(file_field? || text_area_field?)
  end

  def file_field?
    ['file'].include?(field_type)
  end

  def text_area_field?
    ['body'].include?(field_type)
  end


  # -- Relationships --------------------------------------------------------


  # -- Callbacks ------------------------------------------------------------


  # -- Validations ----------------------------------------------------------


  # -- Scopes ---------------------------------------------------------------


  # -- Class Methods --------------------------------------------------------


  # -- Instance Methods -----------------------------------------------------


end
