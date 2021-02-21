class BriefingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_briefing, only: %i[show edit update destroy]

  # GET /briefings or /briefings.json
  def index
    @briefings = Briefing.where(user_id: current_user.id)
  end

  # GET /briefings/1 or /briefings/1.json
  def show; end

  # GET /briefings/new
  def new
    @briefing = Briefing.new
  end

  # GET /briefings/1/edit
  def edit; end

  # POST /briefings or /briefings.json
  def create
    @briefing = Briefing.new(briefing_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @briefing.save
        format.html { redirect_to @briefing, notice: 'Briefing was successfully created.' }
        format.json { render :show, status: :created, location: @briefing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @briefing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /briefings/1 or /briefings/1.json
  def update
    respond_to do |format|
      if @briefing.update(briefing_params)
        format.html { redirect_to @briefing, notice: 'Briefing was successfully updated.' }
        format.json { render :show, status: :ok, location: @briefing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @briefing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /briefings/1 or /briefings/1.json
  def destroy
    @briefing.destroy
    respond_to do |format|
      format.html { redirect_to briefings_url, notice: 'Briefing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_briefing
    @briefing = Briefing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def briefing_params
    params.require(:briefing).permit(:name, :bot_id, :period, :interval, :next_run_at,
                                     { feed_ids: [] })
  end
end
