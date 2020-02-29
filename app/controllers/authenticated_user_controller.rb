class AuthenticatedUserController < ApplicationController
  include Errorable

  before_action :authenticate_user!
end
