class VocabsController < ApplicationController

  def index 
    @vocabs = current_user.vocabs.all
  end 

  def new 
    @vocab = Vocab.new
  end 
  
  def create 
    @vocab = current_user.vocabs.build(vocab_params)
    if @vocab.save
      redirect_to vocabs_path 
    else   
      render :new
    end
  end

  private 

  def vocab_params 
    params.require(:vocab).permit(:word_or_phrase, :memo)
  end
end
