# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.irregular 'cuadrilla', 'cuadrillas'
  inflect.irregular 'via', 'vias'
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
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
