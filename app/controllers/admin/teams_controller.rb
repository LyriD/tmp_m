class Admin::TeamsController < Comfy::Admin::Cms::BaseController

  before_action :build_team,  :only => [:new, :create]
  before_action :load_team,   :only => [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
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
    @team.save!
    flash[:success] = 'Human created'
    redirect_to :action => :show, :id => @team
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Team'
    render :action => :new
  end

  def update
    @team.update_attributes!(team_params)
    flash[:success] = 'Team updated'
    redirect_to :action => :show, :id => @team
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Team'
    render :action => :edit
  end

  def destroy
    @team.destroy
    flash[:success] = 'Team deleted'
    redirect_to :action => :index
  end

  def update_row_order
    @team = Team.find(reorder_params[:team_id])
    Rails.logger.info "PARAMS IN TEAM #{reorder_params[:row_order_position]}"
    @team.set_list_position(reorder_params[:row_order_position].to_i)
    Rails.logger.info "ROW ORDER IN TEAM #{@team.position}"
    @team.save

    render nothing: true
  end


protected

  def build_team
    @team = Team.new(team_params)
  end

  def load_team
    @team = Team.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Team not found'
    redirect_to :action => :index
  end

  def reorder_params
    params.fetch(:team, {}).permit(:team_id, :row_order_position)
  end

  def team_params
    params.fetch(:team, {}).permit(:name, :position, :status, :photo, :short_desc, :desc)
  end
end