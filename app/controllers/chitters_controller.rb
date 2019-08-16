class ChittersController < ApplicationController
  before_action :set_chatter, only: [:edit, :update, :destroy]
  def index
    @chitters = Chitter.all.order('id DESC')
  end

  def new
    @chitter = Chitter.new
  end

  def create
    @chitter = Chitter.new(chitter_params)
    if params[:back]
      render :new
    else
      if @chitter.save
        redirect_to chitters_path, notice: "ツイートを投稿しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @chitter.update(chitter_params)
      redirect_to chitters_path, notice: "ツイートを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @chitter.destroy
    redirect_to chitters_path, notice:"ツイートを削除しました！"
  end

  def confirm
    @chitter = Chitter.new(chitter_params)
    render :new if @chitter.invalid?
  end

  private
  
  def chitter_params
    params.require(:chitter).permit(:tweet)
  end

  def set_chatter
    @chitter = Chitter.find(params[:id])
  end
end
