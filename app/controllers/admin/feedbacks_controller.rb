class Admin::FeedbacksController < Comfy::Admin::Cms::BaseController

  before_action :build_feedback,  :only => [:new, :create]
  before_action :load_feedback,   :only => [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.page(params[:page])
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @feedback.save!
    flash[:success] = 'Feedback created'
    redirect_to :action => :show, :id => @feedback
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Feedback'
    render :action => :new
  end

  def update
    @feedback.update_attributes!(feedback_params)
    flash[:success] = 'Feedback updated'
    redirect_to :action => :show, :id => @feedback
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Feedback'
    render :action => :edit
  end

  def destroy
    @feedback.destroy
    flash[:success] = 'Feedback deleted'
    redirect_to :action => :index
  end

protected

  def build_feedback
    @feedback = Feedback.new(feedback_params)
  end

  def load_feedback
    @feedback = Feedback.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Feedback not found'
    redirect_to :action => :index
  end

  def feedback_params
    params.fetch(:feedback, {}).permit(
        :theme,
        :name,
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
        :body
    )
  end
end