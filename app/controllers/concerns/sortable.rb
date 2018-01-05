module Sortable
  extend ActiveSupport::Concern

  def reorder
    params[:elements].each_with_index do |id, index|
      sort_collection.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

end
