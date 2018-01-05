module Fileable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :files

    def table_id_seq
      "#{name.tableize}_id_seq"
    end

    def sqlite_table_name
      self.table_name
    end
  end

  included do

    @files ||= %w(image)

    for atributo in @files
      dragonfly_accessor atributo do
        after_assign do |file|
          file.encode!('jpg', '-quality 80').process!(:thumb, '1600x900>') if file.ext.downcase == 'jpg' && new_record?
        end
        storage_options do |f|
          { path: File.join(folder, f.name) }
        end
      end
    end

  end

  def folder
    File.join self.class.name.tableize, (id.to_s.presence || next_id.to_s)
  end

  def next_id
    if Rails.env.production?
      ActiveRecord::Base.connection.execute("select last_value from #{self.class.table_id_seq}").first["last_value"]
    else
      ActiveRecord::Base.connection.execute("SELECT seq FROM SQLITE_SEQUENCE WHERE name = '#{self.class.sqlite_table_name}' LIMIT 1").first['seq'].to_i.next;
    end
  end
end
