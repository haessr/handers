class NposController < ApplicationController

  def index
   @npos  = policy_scope(Npo.all)

  end
  def new
    @npo = Npo.new
    authorize @npo
  end

  def show
    @npo = Npo.find(params[:id])
    authorize @npo
  end


  def create
    @npo = Npo.new(npo_params)
    authorize @npo
    if @npo.save
      redirect_to npo_path(@npo)
    else
      render :new
    end
  end

  def destroy
    @npo = Npo.find(params[:id])
    authorize @npo
    @npo.destroy
    redirect_to npo_path
  end

  private

  def npo_params
    params.require(:npo).permit(:name, :description, :url, :photo)
  end

end
