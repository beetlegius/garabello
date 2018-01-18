class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    can :update, user
    can :root, :base

    case user.role
    when User::SUPERADMIN
      can :manage, :all
    when User::ADMIN
      can :manage, Cuadrilla
      can :manage, Empleado
      can :manage, Recurso
      can :manage, Ramal
      can :manage, Tarea
      can :manage, TipoPrograma
      can :manage, Programa
      can :manage, Jornada
      can :manage, Trabajo
      can :manage, Consumo
      can :manage, Asistencia
      can :manage, Cip
      can :manage, Producto
      can :manage, Movimiento
      can :manage, ItemMovimiento
    when User::STORAGE
      can :index, Producto
      can :manage, Movimiento
      can :manage, ItemMovimiento
      cannot :destroy, Movimiento
    when User::PROGRAM
      can :manage, Programa
      can :manage, Jornada
      can :manage, Trabajo
      can :manage, Consumo
      can :manage, Asistencia
      cannot :destroy, Programa
    end

  end
end
