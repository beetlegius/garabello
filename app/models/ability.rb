class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    can :update, user

    case user.role
    when User::SUPERADMIN
      can :manage, :all
    when User::ADMIN
      can :manage, Cuadrilla
      can :manage, Empleado
      can :manage, Recurso
      can :manage, Via
      can :manage, Tarea
      can :manage, Programa
      can :manage, Trabajo
      can :manage, Consumo
      can :manage, Asistencia
    end

  end
end
