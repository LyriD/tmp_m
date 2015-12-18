class Admin::FeedBackFormFieldsController < Comfy::Admin::Cms::BaseController

  before_action :build_feed_back_form_field, only: [:new, :create]
  before_action :load_feed_back_form_field,  only: [:show, :edit, :update, :destroy]
  before_action :load_collections,           only: [:new, :edit, :create, :update]

  def index
    @feed_back_form_fields = FeedBackFormField.ordered.page(params[:page])
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
    @feed_back_form_field.save!
    flash[:success] = 'Feed Back Form Field created'
    redirect_to :action => :show, :id => @feed_back_form_field
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Feed Back Form Field'
    render :action => :new
  end

  def update
    @feed_back_form_field.update_attributes!(feed_back_form_field_params)
    flash[:success] = 'Feed Back Form Field updated'
    redirect_to :action => :show, :id => @feed_back_form_field
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Feed Back Form Field'
    render :action => :edit
  end

  def destroy
    @feed_back_form_field.destroy
    flash[:success] = 'Feed Back Form Field deleted'
    redirect_to :action => :index
  end

protected
  def load_collections
    @field_types = FeedBackFormField.field_types
    @feed_back_forms = FeedBackForm.all
  end

  def build_feed_back_form_field
    @feed_back_form_field = FeedBackFormField.new(feed_back_form_field_params)
  end

  def load_feed_back_form_field
    @feed_back_form_field = FeedBackFormField.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Feed Back Form Field not found'
    redirect_to :action => :index
  end

  def feed_back_form_field_params
    params.fetch(:feed_back_form_field, {}).permit(:field_type, :feed_back_form_id, :required, :placeholder, :position).tap do |p|
      p[:field_type] = p[:field_type].to_i if p[:field_type].present?
    end
  end
end