class ExamplesController < ApplicationController

  def new
    @example = Example.new
  end
  

  def create
    @example.vocab_id = Vocab.find(params[:id])
    @example = Example.create(example_params)
    
    binding.pry
    
    if @example.save
      
      binding.pry
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





