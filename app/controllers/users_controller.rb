class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json


   def create
    @event =Event.find(params[:event_id])
    @user = @event.users.create(params[:user].permit(:name, :mobile, :twitter_handle, :company))

    respond_to do |format|
      if @user.save
        format.html { redirect_to event_path(@event), notice: 'Thanks for Joining us in Mumbai on Rails meetup :)' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to new_event_user_path(@event) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mobile, :twitter_handle, :company)
    end
end
