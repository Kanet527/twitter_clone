class TwClonesController < ApplicationController
  def top
  end
  
  def index
    @twcs = TwClone.all.order(updated_at: :desc)
  end
  
  def new
    @twc = TwClone.new
    p @twc
  end
  
  def confirm
    @twc = TwClone.new(tw_params)
    if @twc.invalid?
      render :new
    end
  end
  
  def create
    @twc = TwClone.new(tw_params)
    p @twc
    if confirm_params == '戻る'
      render :new
    elsif @twc.save
      flash[:notice] = '投稿しました！'
       redirect_to tw_clones_path
    else
      render :new
    end
  end
  
  def edit
    @twc = TwClone.find(params[:id])
  end
  
  def update
    @twc = TwClone.find(params[:id])
    if @twc.update(content: tw_params[:content])
      flash[:notice] = '編集しました！'
      redirect_to tw_clones_path
    else
      render :edit
    end
  end
  
  def destroy
    @twc = TwClone.find(params[:id])
    @twc.destroy
    flash[:notice] = '削除しました！'
    redirect_to tw_clones_path
  end
  
  private
  
  def tw_params
    params.require(:tw_clone).permit(:content)
  end
  
  def confirm_params
    params.require(:commit)
  end
  
  
end
