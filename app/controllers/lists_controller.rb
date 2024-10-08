class ListsController < ApplicationController

def index
  @lists = List.all
  @list = List.new
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to @list
  else
    render :new
  end
end



def show
  @list = List.find(params[:id])
  @bookmark = @list.bookmarks.build
end

def destroy
  @list = List.find(params[:id])
  @list.destroy
  redirect_to @list, status: :see_other
end


private

def list_params
  params.require(:list).permit(:name)
end


end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to @list, notice: 'List was successfully created.'
  else
    render :new
  end
end
