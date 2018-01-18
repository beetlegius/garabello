# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )

  inflect.plural /([taeiou])([A-Z]|_|$)/, '\1s\2'   # Si el singular termina en vocal, el plural agrega 's'
  inflect.plural /([rlnd])([A-Z]|_|$)/, '\1es\2'   # Si el singular termina en consonante, el plural agrega 'es'
  inflect.plural /([z])([A-Z]|_|$)/, 'ces\2'       # Si el singular termina en 'z', el plural agrega 'ces'
  inflect.singular /([taeiou])([A-Z]|_|$)/, '\1\2'  # Si el singular termina en vocal, queda así
  inflect.singular /([aeiou])s([A-Z]|_|$)/, '\1\2' # Si el plural termina en vocal + 's', quita 's'
  inflect.singular /([rlnd])es([A-Z]|_|$)/, '\1\2' # Si el plural termina en consonante + 'es', quita 'es'
  inflect.singular /([c])es([A-Z]|_|$)/, 'z\2'     # Si el plural termina en 'ces', quita 'es' y reemplaza 'c' por 'z'

  inflect.irregular 'cuadrilla', 'cuadrillas'
  inflect.irregular 'ramal', 'ramales'
  inflect.irregular 'empleado', 'empleados'
  inflect.irregular 'recurso', 'recursos'
  inflect.irregular 'tarea', 'tareas'
  inflect.irregular 'programa', 'programas'
  inflect.irregular 'asistencia', 'asistencias'
  inflect.irregular 'consumo', 'consumos'
  inflect.irregular 'trabajo', 'trabajos'
  inflect.irregular 'trabajo_pam', 'trabajos_pam'
  inflect.irregular 'trabajo_pat', 'trabajos_pat'
  inflect.irregular 'trabajo_fp',  'trabajos_fp'

  inflect.irregular 'sector',  'sectores'
  inflect.irregular 'tipo_programa',  'tipos_programa'

  inflect.irregular 'item_movimiento', 'items_movimiento'
  inflect.irregular 'user', 'users'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
