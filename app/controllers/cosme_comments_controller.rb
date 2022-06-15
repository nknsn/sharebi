class CosmeCommentsController < ApplicationController
  
  def create
    cosmetic = Cosmetic.find(params[:cosmetic_id])
    comment = current_user.cosme_comments.new(cosme_comment_params)
    comment.cosmetic_id = cosmetic.id
    comment.save
    redirect_to cosmetic_path(cosmetic)
  end
  
  def destroy
    CosmeComment.find(params[:id]).destroy
    redirect_to cosmetic_path(params[:cosmetic_id])
  end

  private

  def cosme_comment_params
    params.require(:cosme_comment).permit(:comment)
  end
  
end
