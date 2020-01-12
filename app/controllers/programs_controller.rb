class ProgramsController < ApplicationController
  before_action :prepare_activity_period_for_db_format, only: [:create]
  before_action :set_program, only: [:destroy]

  # GET /programs
  def index
    @programs = Program.all
  end

  # GET /programs/1
  #def show
  #end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  #def edit
  #end

  # POST /programs
  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to programs_path, notice: 'Program was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /programs/1
  #def update
  #  if @program.update(program_params)
  #    redirect_to @program, notice: 'Program was successfully updated.'
  #  else
  #    render :edit
  #  end
  #end

  # DELETE /programs/1
  def destroy
    @program.destroy
    redirect_to programs_url, notice: 'Program was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_program
    @program = Program.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def program_params
    params.require(:program).permit(:title, :activity_period)
  end

  def prepare_activity_period_for_db_format
    params[:program][:activity_period] = "[#{params[:program][:activity_period]}]" if params[:program][:activity_period]
  end
end
