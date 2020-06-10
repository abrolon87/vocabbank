class VocabsController < ApplicationController

  def new 
    @vocab = Vocab.new
  end 
  

end
