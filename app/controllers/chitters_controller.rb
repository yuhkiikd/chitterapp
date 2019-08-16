class ChittersController < ApplicationController
  def index
    @chitters = Chitter.all
  end

  def new
    @chitter = Chitter.new
  end

  def create
    @chitter = Chitter.new(chitter_params)
    if @chitter.save
      redirect_to chitters_path, notice: "ツイートを投稿しました！"
    else
      render :new
    end
  end

  private
  
  def chitter_params
    params.require(:chitter).permit(:tweet)
  end
end
