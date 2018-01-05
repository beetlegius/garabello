class UsersDatatable < ApplicationDatatable

  private

  def data
    users.map do |user|
      [].tap do |column|
        column << user.id
        column << (user.image.present? ? @view.image_tag(user.image.thumb('100x').url, class: 'img-responsive') : nil)
        column << user.name
        column << user.email

        links = []
        links.push @view.link_to('Editar', @view.edit_admin_user_path(user), class: 'btn btn-xs btn-flat btn-info')
        links.push @view.link_to('Eliminar', @view.admin_user_path(user), method: :delete, class: 'btn btn-xs btn-flat btn-danger', data: { confirm: @view.t(:confirm) })
        column << @view.tag.div(links.join.html_safe, class: 'btn-group pull-right')
      end
    end
  end

  def count
    users.count
  end

  def total_entries
    users.count
  end

  def users
    @users ||= User.all
  end

end
