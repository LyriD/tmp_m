class Admin::ServicesController < Comfy::Admin::Cms::BaseController

  before_action :build_service,    only: [:new, :create]
  before_action :users_collection, only: [:new, :edit]
  before_action :load_service,     only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.page(params[:page])
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
    @service.save!
    flash[:success] = 'Service created'
    redirect_to :action => :show, :id => @service
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Service'
    render :action => :new
  end

  def update
    @service.update_attributes!(service_params)
    flash[:success] = 'Service updated'
    redirect_to :action => :show, :id => @service
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Service'
    render :action => :edit
  end

  def destroy
    @service.destroy
    flash[:success] = 'Service deleted'
    redirect_to :action => :index
  end

protected

  def users_collection
    @users = User.all
  end

  def build_service
    @service = Service.new(service_params)
  end

  def load_service
    @service = Service.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Service not found'
    redirect_to :action => :index
  end

  def service_params
    params.fetch(:service, {}).permit(:url, :name, :user_id)
  end
end