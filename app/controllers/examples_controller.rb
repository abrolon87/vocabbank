class ExamplesController < ApplicationController
  
  before_action :get_vocab, only: [:index]
  
  def index 
    #@vocab = params[:vocab_id]
  
    @examples = @vocab.examples
    
  end

  def new
    
  #   @example = Example.new
  #   @vocab = Vocab.find_by(id: params[:id])
    #@vocab = Vocab.find_by(id: params[:id]) # find_by returnsnil if doesnt find anything ...find gives an error
    
    @example = Example.new
    @example.vocab_id = params[:vocab_id] 
    
  end
  

  def create
    
    @example = Example.new(example_params)
    

    #@example.vocab_id = params[:vocab_id]
    if @example.save
      
      redirect_to vocab_examples_path(@example.vocab_id)
    else  
      redirect_to '/'
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





