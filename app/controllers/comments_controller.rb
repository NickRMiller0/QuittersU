class CommentsController < ApplicationController


def create
    @pin = Pins.find(params[:id])
    @user_who_commented = @current_user
    @comment = Comment.build_from( @pin, @user_who_commented.id, "Hey guys this is my   comment!" )
  end
end