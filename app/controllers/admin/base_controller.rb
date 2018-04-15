class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    return if current_user.admin?
    redirect_to root_path, alert: t('admin.base.admin_required')
  end

end
