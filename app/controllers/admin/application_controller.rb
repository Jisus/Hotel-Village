class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_usuario!
  
  layout "admin"
end
