# == Schema Information
#
# Table name: feed_back_forms
#
#  id         :integer          not null, primary key
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class FeedBackForm < ActiveRecord::Base
  belongs_to :service
  delegate :name, to: :service

  has_many :feed_back_form_fields, dependent: :destroy

  validates :service, presence: true

  # -- Relationships --------------------------------------------------------


  # -- Callbacks ------------------------------------------------------------


  # -- Validations ----------------------------------------------------------


  # -- Scopes ---------------------------------------------------------------


  # -- Class Methods --------------------------------------------------------


  # -- Instance Methods -----------------------------------------------------


end
