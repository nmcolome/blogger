class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  before_action :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def destroy
    @tag.destroy
    flash.notice = "Tag #{@tag.name} was deleted."

    redirect_to tags_path
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def require_login
      unless current_user
        redirect_to root_path
        return false
      end
    end
end