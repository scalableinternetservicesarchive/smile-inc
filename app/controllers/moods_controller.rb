class MoodsController < ApplicationController
  before_action :set_mood, only: [:show, :edit, :update, :destroy]

  # GET /moods
  # GET /moods.json
  def index
    #need to get the user id in order to show the moods
    @user = current_user
    @moods = @user.mood.all
    #@moods = Mood.all
  end

  # GET /moods/1
  # GET /moods/1.json
  def show
  end

  # GET /moods/new
  def new
    #only currently signed in users can create it
    if user_signed_in?
      @user = current_user
      @mood = @user.mood.new
      #@mood = Mood.new
    end
  end

  # GET /moods/1/edit
  def edit
  end

  # POST /moods
  # POST /moods.json
  def create
    #only current users can create it
    @user = current_user
    @mood = @user.mood.new(mood_params)

    respond_to do |format|
      if @mood.save
        format.html { redirect_to @mood, notice: 'Mood was successfully created.' }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render :new }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moods/1
  # PATCH/PUT /moods/1.json
  def update
    respond_to do |format|
      if @mood.update(mood_params)
        format.html { redirect_to @mood, notice: 'Mood was successfully updated.' }
        format.json { render :show, status: :ok, location: @mood }
      else
        format.html { render :edit }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moods/1
  # DELETE /moods/1.json
  def destroy
    @mood.destroy
    respond_to do |format|
      format.html { redirect_to moods_url, notice: 'Mood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood
      @mood = Mood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_params
      params.require(:mood).permit(:color, :mood, :user_id)
    end
end
