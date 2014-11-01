class UsersController < ApplicationController
  before_action :authenticate_user!

  def dash_board
  end
end