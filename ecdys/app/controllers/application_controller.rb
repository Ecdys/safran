class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'batchbook'
  BatchBook.account = 'ecdys'
  BatchBook.token = 'bMYEvbMlJQ'
end
