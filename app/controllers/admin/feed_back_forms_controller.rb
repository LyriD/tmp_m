class Admin::FeedBackFormsController < Comfy::Admin::Cms::BaseController
  before_action :build_feed_back_form,    only: [:new, :create]
  before_action :load_feed_back_form,     only: [:show, :edit, :update, :destroy]
  before_action :load_service_collection, only: [:new, :edit, :create, :update]

  def index
    @feed_back_forms = FeedBackForm.page(params[:page])
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
    @feed_back_form.save!
    flash[:success] = 'Feed Back Form created'
    redirect_to :action => :show, :id => @feed_back_form
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Feed Back Form'
    render :action => :new
  end

  def update
    @feed_back_form.update_attributes!(feed_back_form_params)
    flash[:success] = 'Feed Back Form updated'
    redirect_to :action => :show, :id => @feed_back_form
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Feed Back Form'
    render :action => :edit
  end

  def destroy
    @feed_back_form.destroy
    flash[:success] = 'Feed Back Form deleted'
    redirect_to :action => :index
  end

protected

  def load_service_collection
    @services = Service.all
  end

  def build_feed_back_form
    @feed_back_form = FeedBackForm.new(feed_back_form_params)
  end

  def load_feed_back_form
    @feed_back_form = FeedBackForm.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Feed Back Form not found'
    redirect_to :action => :index
  end

  def feed_back_form_params
    params.fetch(:feed_back_form, {}).permit(:service_id)
  end
end