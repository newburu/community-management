module UserstampsConcern
  extend ActiveSupport::Concern

  included do
    before_create :update_created_by
    before_update :update_updated_by
    before_destroy :update_deleted_by
  end

  def update_created_by
    self.created_by_id = current_user.id
    self.updated_by_id = current_user.id
  end

  def update_updated_by
    self.updated_by_id = current_user.id
  end

  def update_deleted_by
    self.deleted_by_id = current_user.id
  end

  def current_user
    User.current_user
  end
end