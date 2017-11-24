module Destroyable
  extend ActiveSupport::Concern

  included do
    acts_as_paranoid
  end

  def can_delete?
    true
  end

  def destroy
    super if can_delete?
  end

end
