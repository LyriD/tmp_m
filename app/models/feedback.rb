# == Schema Information
#
# Table name: feedbacks
#
#  id                    :integer          not null, primary key
#  theme                 :string
#  client_name           :string
#  email                 :string
#  invoice_number        :string
#  company_name          :string
#  general_manager       :string
#  legal_address         :string
#  fact_address          :string
#  mail_address          :string
#  inn                   :string
#  kpp                   :string
#  phone                 :string
#  bank_name             :string
#  bic                   :string
#  correspondent_account :string
#  checking_account      :string
#  body                  :text
#  created_at            :datetime
#  updated_at            :datetime
#  file_file_name        :string
#  file_content_type     :string
#  file_file_size        :integer
#  file_updated_at       :datetime
#  service_id            :integer
#

class Feedback < ActiveRecord::Base
  has_attached_file :file, less_than: 18.megabytes
  do_not_validate_attachment_file_type :file

  belongs_to :service

  def service_name
    service.try(:name)
  end

  # -- Relationships --------------------------------------------------------


  # -- Callbacks ------------------------------------------------------------


  # -- Validations ----------------------------------------------------------


  # -- Scopes ---------------------------------------------------------------


  # -- Class Methods --------------------------------------------------------


  # -- Instance Methods -----------------------------------------------------


end
