class ExamplesController < ApplicationController
  
  before_action :get_vocab, only: [:index]
  
  def index
    @examples = @vocab.examples
  end

  def new
    @example = Example.new
    @example.vocab_id = params[:vocab_id] 
  end
  
  def create
    @example = Example.new(example_params)
    
    if @example.save
      redirect_to vocab_examples_path(@example.vocab_id)
    else  
      render 'new'
    end
  end
   
  def show 
    @example = Example.find_by(id: params[:id])
  end

  def destroy
    #@vocab = Vocab.find(params[:vocab_id])
    @example = Example.find(params[:id])
    @example.delete 
    redirect_to vocab_examples_path(@example.vocab_id)
  end 

  private 

  def example_params 
    params.require(:example).permit(:sentence, :vocab_id)
  end

  def get_vocab
    @vocab = Vocab.find(params[:vocab_id])
  end

end





