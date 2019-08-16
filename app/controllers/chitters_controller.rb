class ChittersController < ApplicationController
  def index
    @chitters = Chitter.all.order('id DESC')
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

  def edit
    @chitter = Chitter.find(params[:id])
  end

  def update
    @chitter = Chitter.find(params[:id])
    if @chitter.update(chitter_params)
      redirect_to chitters_path, notice: "ツイートを更新しました！"
    else
      render :edit
    end
  end

  private
  
  def chitter_params
    params.require(:chitter).permit(:tweet)
  end
end
