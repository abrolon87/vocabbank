class VocabsController < ApplicationController
  
  def index 
    @vocabs = current_user.vocabs.all
  end 

  def new 
    @vocab = Vocab.new
    
  end 
  
  def create
    
    
    #language = Language.find_or_create_by(language_name: vocab_params[:language_name])
    #@vocab = Vocab.create(vocab_params)
    #@vocab.user = current_user
    @vocab = current_user.vocabs.build(vocab_params)
    
  
    binding.pry
    if @vocab.save
      
      
      redirect_to vocabs_path 
    else   
      render :new
    end
    
  end

#   def destroy
#     @vocab = Vocab.find_by(id: params[:id])
#     if @Vocab.user == current_user 
#     @vocab.delete
#     else 

#    end 
#     redirect_to user_vocabs_path(current_user)
#  end

  private 

  def vocab_params 
    params.require(:vocab).permit(:word_or_phrase, :translation, :user_id, :language_id, language_attributes: [:language_name])
  end
end
