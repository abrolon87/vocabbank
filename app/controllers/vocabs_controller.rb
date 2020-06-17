class VocabsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index 
    @vocabs = current_user.vocabs.all
  end 

  def new 
    @vocab = Vocab.new
    @language = @vocab.build_language
  end 
  
  def create
    #redirect_if_not_logged_in
      @vocab = current_user.vocabs.create(vocab_params) #Vocab.create(vocab_params)
      #@vocab.user = current_user
      #@vocab.language = params["vocab[language_attributes][language_name]"]
      #@vocab.language = Language.find_or_create_by(language_name: vocab_params[:language_name]) 
      if @vocab.save
        redirect_to vocab_path(@vocab)
      else   
        render :new
      end
    
  end

  def show 
    #redirect_if_not_logged_in
    
    @vocab = Vocab.find(params[:id]) # find_by returnsnil if doesnt find anything ...find gives an error
    # @example = Example.new
    # @example.vocab_id = @vocab.id 
    #binding.pry vocab_id not nil here in pry
    
  end

  def edit 
    @vocab = Vocab.find(params[:id])
  end

  def update
    @vocab = Vocab.find(params[:id])
    @vocab.update(vocab_params)
    redirect_to vocab_path(@vocab)
  end

  def destroy
    @vocab = Vocab.find_by_id(params[:id])
    @vocab.delete if @vocab.user == current_user 
    redirect_to vocabs_path(current_user)
  end

  private 

  def vocab_params 
    params.require(:vocab).permit(:word_or_phrase, :translation, :user_id, :language_id, language_attributes: [:language_name])
  end
end
