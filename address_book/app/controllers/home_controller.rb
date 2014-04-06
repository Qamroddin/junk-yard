class HomeController < ApplicationController
  def index
  end
  def me
    if request.post?
      @album=Album.new(params[:album])
      @album_check=Album.find_by_user_id(params[:album][:user_id].to_i)
       unless @album_check.blank?
        @album_check.destroy
        @album.profile_picture = true
        @album.save
      else
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
