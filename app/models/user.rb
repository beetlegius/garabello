class User < ApplicationRecord

  # CONFIG

  include Destroyable

  ROLES = [SUPERADMIN = 'superadmin', ADMIN = 'admin', STORAGE = 'storage', PROGRAM = 'program']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  include Destroyable, Fileable

  # CALLBACKS

  after_initialize :set_role

  # RELATIONS

  has_many :movimientos
  has_many :programas

  # SCOPES

  # VALIDATIONS

  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true
  validates :role, inclusion: { in: ROLES }
  # validates :password, presence: true, confirmation: true

  # CLASS METHODS

  # INSTANCE METHODS

  def is_role?(*roles)
    role.present? && roles.map(&:to_s).include?(role)
  end

  def can_delete?
    !is_role? SUPERADMIN
  end

  # ALIASES

  alias_attribute :to_s, :name
  alias_attribute :to_label, :name

  # PRIVATE METHODS

  private

  def set_role
    self.role ||= ADMIN
  end

end
