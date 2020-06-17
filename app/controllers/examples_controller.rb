class ExamplesController < ApplicationController

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
      redirect_to example_path(@example)
    else  
      redirect_to '/'
    end
  end
   
    

  def show 
    @example = Example.find_by(id: params[:id])
  end


  private 

  def example_params 
    params.require(:example).permit(:sentence, :vocab_id)
  end

end





