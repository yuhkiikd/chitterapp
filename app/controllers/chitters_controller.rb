class ChittersController < ApplicationController
  def new
    @chitter = Chitter.new
  end

  def create
    Chitter.create(chitter_params)
    redirect_to new_chitter_path
  end

  private
  
  def chitter_params
    params.require(:chitter).permit(:tweet)
  end
end
