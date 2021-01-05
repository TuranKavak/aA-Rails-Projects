class SubsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  before_action :require_user_owns_sub!, only: [:edit, :update]


  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
    render :index
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
    @sub = Sub.find(params[:id])
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
    @sub = Sub.find(params[:id])
  end

  # POST /subs
  # POST /subs.json
  def create
      @sub = current_user.subs.new(sub_params)
      if @sub.save
        redirect_to sub_url(@sub)
      else
        flash.now[:errors] = @sub.errors.full_messages
        render :new
      end
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  # def destroy
  #   @sub.destroy
  #   respond_to do |format|
  #     format.html { redirect_to subs_url, notice: 'Sub was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def require_user_owns_sub!
      @sub = current_user.subs.find_by(id: params[:id])
      render json: 'Forbidden', status: :forbidden
    end

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end
