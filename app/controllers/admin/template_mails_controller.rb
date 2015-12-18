class Admin::TemplateMailsController < Comfy::Admin::Cms::BaseController
  before_action :build_template_mail,  only: [:new, :create]
  before_action :load_template_mail,   only: [:show, :edit, :update, :destroy, :send_mail]

  def index
    @template_mails = TemplateMail.page(params[:page])
  end

  def show
    render
  end

  def send_mail
    Notification.run(@template_mail)
    flash.now[:success] = 'Письма отправлены'
    redirect_to action: :edit
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @template_mail.save!
    add_offerings(@template_mail, offerings_params)
    flash[:success] = 'Template Mail created'
    redirect_to action: :show, id: @template_mail
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Template Mail'
    render action: :new
  end

  def update
    @template_mail.update_attributes!(template_mail_params)
    add_offerings(@template_mail, offerings_params)
    flash[:success] = 'Template Mail updated'
    redirect_to action: :show, id: @template_mail
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Template Mail'
    render action: :edit
  end

  def destroy
    @template_mail.destroy
    flash[:success] = 'Template Mail deleted'
    redirect_to action: :index
  end

  protected

  def add_offerings(template_mail, offering_array)
    template_mail.offerings = []
    offering_array.each do |offering_id|
      return if @template_mail.offering_ids.include?(offering_id)
      @template_mail.offerings << Offering.find_or_create_by!(offering_id: offering_id)
    end
  end

  def build_template_mail
    @template_mail = TemplateMail.new(template_mail_params)
  end

  def load_template_mail
    @template_mail = TemplateMail.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Template Mail not found'
    redirect_to action: :index
  end

  def template_mail_params
    params.fetch(:template_mail, {}).permit(:name, :body, :theme, :period, :bcc)
  end

  def offerings_params
    result = params.fetch(:template_mail, {}).fetch(:offerings, [])
    result = result.delete_if(&:empty?)
    result.uniq
  end
end