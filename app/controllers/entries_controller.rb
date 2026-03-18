class EntriesController < ApplicationController

    def index
       @entries = ExampleModel.all()
   end

   def new
       @entry = ExampleModel.new()
   end

   def create
       @entry = ExampleModel.new(entry_params)
       if @entry.save
           redirect_to root_url
       else
           render :new
       end
   end

def destroy
    Entry.find(params[:id]).destroy
    redirect_to root_url
end

   private

   def entry_params
       params.require(:entry).permit(:name)
   end
   
end
