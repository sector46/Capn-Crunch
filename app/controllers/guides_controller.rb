class GuidesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:new, :show, :edit, :update]
  before_action :correct_user,   only: [:new, :edit, :update]

  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find(params[:id])
    @reviews = @guide.reviews.paginate(page: params[:page])
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)

    # converting array to string
    location = params[:location]
    if !location.nil?
      @guide.location = location.join(', ')
    end
    specialty = params[:specialty]
    if !specialty.nil?
      @guide.specialty = specialty.join(', ')
    end

    @guide.user_id = current_user.id

    if @guide.save
      user = current_user
      log_out
      log_in user
      flash[:success] = "Congratulations! You are now a guide"
      redirect_to @guide
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def mtbachelor
  end

  def mthood
  end

  def mtwhistler
  end

  private
    def guide_params
      params.require(:guide).permit(:user_id,
                                    :location,
                                    :specialty,
                                    :rate,
                                    :sun_avail,
                                    :mon_avail,
                                    :tues_avail,
                                    :wed_avail,
                                    :thurs_avail,
                                    :fri_avail,
                                    :sat_avail)
    end

end
