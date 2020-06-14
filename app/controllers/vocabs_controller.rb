class VocabsController < ApplicationController
  
  def index 
    @vocabs = current_user.vocabs.all
  end 

  def new 
    @vocab = Vocab.new
    @vocab.build_language
  end 
  
  def create
    
    
    
    #@vocab = Vocab.create(vocab_params)
    #@vocab.user = current_user
    @vocab = Vocab.create(vocab_params)
    @vocab.user = current_user
    @vocab.language = Language.find_or_create_by(language_name: vocab_params[:language_name]) 
    
    if @vocab.save
      redirect_to vocab_path(@vocab)
    else   
      render :new
    end
    
  end

  def show 
    redirect_if_not_logged_in
    @vocab = Vocab.find_by_id(params[:id]) # nil if doesnt find anything ...find gives an error
  end

  def destroy
    @vocab = Vocab.find_by_id(params[:id])
    if @vocab.user == current_user 
    @vocab.delete
    else 

   end 
    redirect_to vocabs_path(current_user)
  end

  private 

  def vocab_params 
    params.require(:vocab).permit(:word_or_phrase, :translation, language_attributes: [:language_name])
  end
end
