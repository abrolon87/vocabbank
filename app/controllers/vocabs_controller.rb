class VocabsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index 
    @vocabs = current_user.vocabs.all.sort_alphabetically
  end 

  def new 
    @vocab = Vocab.new
    @language = @vocab.build_language
  end 
  
  def create
    @vocab = current_user.vocabs.create(vocab_params) 
    if @vocab.save
      redirect_to vocab_path(@vocab)
    else   
      render :new
    end
  end

  def show 
    find_vocab
  end

  def edit 
    find_vocab
  end

  def update
    find_vocab
    @vocab.update(vocab_params)
    redirect_to vocab_path(@vocab)
  end

  def destroy
    find_vocab
    @vocab.delete if @vocab.user == current_user 
    redirect_to vocabs_path(current_user)
  end

  private 

  def vocab_params 
    params.require(:vocab).permit(:word_or_phrase, :translation, :user_id, :language_id, language_attributes: [:language_name])
  end
  
end
