class WorkCardsController < ApplicationController
  before_action :set_work_card, only: [:show, :edit, :update, :destroy]

  # GET /work_cards
  # GET /work_cards.json
  def index
    @work_cards = WorkCard.all
  end

  # GET /work_cards/1
  # GET /work_cards/1.json
  def show
  end

  # GET /work_cards/new
  def new
    @work_card = WorkCard.new
  end

  # GET /work_cards/1/edit
  def edit
  end

  # POST /work_cards
  # POST /work_cards.json
  def create
    @work_card = WorkCard.new(work_card_params)

    respond_to do |format|
      if @work_card.save
        format.html { redirect_to @work_card, notice: 'Work card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_cards/1
  # PATCH/PUT /work_cards/1.json
  def update
    respond_to do |format|
      if @work_card.update(work_card_params)
        format.html { redirect_to @work_card, notice: 'Work card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_cards/1
  # DELETE /work_cards/1.json
  def destroy
    @work_card.destroy
    respond_to do |format|
      format.html { redirect_to work_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_card
      @work_card = WorkCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_card_params
      params.require(:work_card).permit(:start_at, :end_at, :pause)
    end
end
