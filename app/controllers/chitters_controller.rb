class ChittersController < ApplicationController
  before_action :set_chitter, only: [:edit, :update, :destroy]
  before_action :set_order, only:[:index, :create, :confirm]

  def index
    @chitter = Chitter.new
  end

  def create
    @chitter = Chitter.new(chitter_params)
    if params[:back]
      render :index
    else
      if @chitter.save
        redirect_to chitters_path, notice: "ツイートを投稿しました！"
      else
        render :index
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
    render :index if @chitter.invalid?
  end

  private
  
  def chitter_params
    params.require(:chitter).permit(:tweet)
  end

  def set_chitter
    @chitter = Chitter.find(params[:id])
  end

  def set_order
    @chitters = Chitter.all.order('id DESC')
  end

end
