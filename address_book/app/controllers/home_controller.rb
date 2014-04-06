class HomeController < ApplicationController
  def index
  end
  def me
    if request.post?
      @album=Album.new(params[:album])
      @album_check=Album.find_by_user_id(params[:album][:user_id].to_i)
      logger.info "_____SSS #{params[:album][:user_id].inspect},#{session[:user_id].inspect}"
      unless @album_check.blank?

        logger.info "inside unless block"
        @album_check.destroy
        @album.profile_picture = true
        @album.save
        #@album_check1=Album.find_by_user_id(session[:user_id])
        #@album_check1.update_attribute(:profile_picture,true)
      else
        logger.info "________inside else"
        @album.save
        @album_check1=Album.find_by_user_id(params[:album][:user_id].to_i)
        unless @album_check1.blank?
        @album_check1.update_attribute(:profile_picture,true)
          end
      end
      redirect_to :controller=>:home ,:action=>:index
    end
  end
end
