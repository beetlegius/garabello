# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creando usuarios...'
User.create! name: 'Gustavo Molinari',    email: 'info@beetlegius.com.ar',     role: User::SUPERADMIN, password: 'beetlegius'
User.create! name: 'Esteban Suárez',      email: 'estebansuarezbue@gmail.com', role: User::SUPERADMIN, password: 'suarez'
User.create! name: 'Martín Beraldi',      email: 'martinberaldibue@gmail.com', role: User::ADMIN,      password: 'beraldi'
User.create! name: 'Sebastián Garabello', email: 'sebasofse@gmail.com',        role: User::ADMIN,      password: 'garabello'

puts 'Creando cuadrillas...'
5.times do
  Cuadrilla.create! nombre: Faker::Simpsons.character, sector: [Cuadrilla::NORTE, Cuadrilla::SUR].sample
end

puts 'Creando vías...'
Via.create! nombre: 'Mar del Plata'
Via.create! nombre: 'Rosario'
Via.create! nombre: 'Chaco'
Via.create! nombre: 'Tucumán'
Via.create! nombre: 'Bahía Blanca'
Via.create! nombre: 'Mendoza'

puts 'Creando empleados...'
for cuadrilla in Cuadrilla.all
  rand(4..8).times do
    cuadrilla.empleados.create! nombre: Faker::Name.first_name, apellido: Faker::Name.last_name
  end
end

puts 'Creando tareas de vías...'
tareas_vias = Tarea.create! [
  { nombre: "Tapar", unidad: 'metro' },
  { nombre: "Destapar", unidad: 'metro' },
  { nombre: "Ajuste y reemplazo de fijaciones", unidad: 'metro' },
  { nombre: "Cambio de durmientes", unidad: 'unidad' },
  { nombre: "Escuadrar durmientes", unidad: 'unidad' },
  { nombre: "Tratamiento de juntas", unidad: 'unidad' },
  { nombre: "Reemplazo de rieles", unidad: 'metro' },
  { nombre: "Conservacion geométrica manual", unidad: 'metro' },
  { nombre: "Tareas de conservación ADV", unidad: 'unidad' },
  { nombre: "Desmalezado, desmonte, carpir", unidad: 'metro_2' },
  { nombre: "Nivelación longitudinal", unidad: 'metro' },
  { nombre: "Nivelación de juntas", unidad: 'unidad' },
  { nombre: "Alinear vía", unidad: 'metro' },
  { nombre: "Perfilar (zanja, tajeas)", unidad: 'metro' },
  { nombre: "Corrección de trocha", unidad: 'metro' },
  { nombre: "Tareas de vía en PaNs", unidad: 'unidad' },
  { nombre: "Manipuleo, carga y descarga de materiales", unidad: 'tonelada' },
  { nombre: "Limpieza lugar de trabajo y reparación de herramientas", unidad: 'hora' },
  { nombre: "Traslado base a obradores", unidad: 'kilometro' }
]

puts 'Creando tareas de puentes...'
tareas_puentes = Tarea.create! [
  { nombre: "Limpieza e inspeccion de apoyos", unidad: "metro_2" },
  { nombre: "Desmalezado y limpieza de alas y estribos", unidad: "metro_2" },
  { nombre: "Ajuste y reposición de bulon / amarre", unidad: "unidad" },
  { nombre: "Revisión de clavaderas y juntas de vía en puentes", unidad: "unidad" },
  { nombre: "Revisión de clavadura de contrarrieles", unidad: "unidad" },
  { nombre: "Armado de Pilastra", unidad: "unidad" },
  { nombre: "Repracion y sellado de grietas ", unidad: "metro" },
  { nombre: "Limpiar cauce", unidad: "metro" },
  { nombre: "Revision y tratamientos de zores", unidad: "unidad" },
  { nombre: "Limpieza de drenajes ", unidad: "unidad" },
  { nombre: "Nivelacion a punto fijo", unidad: "metro" },
  { nombre: "Tratamiento de pintura", unidad: "metro_2" }
]
tareas_puentes << Tarea.find_by(nombre: 'Cambio de durmientes')

puts 'Creando recursos de vías...'
recursos_vias = Recurso.create! [
  { nombre: 'Durmiente', unidad: 'unidad' },
  { nombre: 'Bulón para eclisa', unidad: 'unidad' },
  { nombre: 'Arandela grower', unidad: 'unidad' },
  { nombre: 'Tirafondos para vía', unidad: 'unidad' },
  { nombre: 'Eclisa para riel', unidad: 'unidad' },
  { nombre: 'Riel', unidad: 'metro' },
  { nombre: 'Mecha', unidad: 'unidad' },
  { nombre: 'Disco de corte', unidad: 'unidad' },
  { nombre: 'Balasto', unidad: 'tonelada' },
  { nombre: 'Aceite', unidad: 'litro' },
  { nombre: 'Tanza', unidad: 'metro' },
  { nombre: 'Grasa', unidad: 'kilo' },
  { nombre: 'Nafta moto - herramientas', unidad: 'litro' },
  { nombre: 'Nafta zorra - movilidad', unidad: 'litro' },
  { nombre: 'Herbicida', unidad: 'litro' }
]

puts 'Creando recursos de puentes...'
recursos_puentes = Recurso.create! [
  { nombre: 'Elementos para Pintura', unidad: 'unidad' },
  { nombre: 'Cal', unidad: 'kilo' },
  { nombre: 'Cemento', unidad: 'kilo' },
  { nombre: 'Arena', unidad: 'metro_3' },
  { nombre: 'Barra De Hierro', unidad: 'unidad' },
  { nombre: 'Electrodo', unidad: 'unidad' }
]

recursos_puentes << Recurso.where(nombre: ['Mecha', 'Herbicida', 'Grasa', 'Nafta moto - herramientas', 'Nafta zorra - movilidad', 'Tanza', 'Aceite', 'Disco de corte', 'Durmiente', 'Bulón para eclisa', 'Arandela grower', 'Tirafondos para vía'])

tipo_programa_vias = TipoPrograma.create! nombre: 'Vías'
tipo_programa_puentes = TipoPrograma.create! nombre: 'Puentes'
tipo_programa_senalamiento = TipoPrograma.create! nombre: 'Señalamiento'
tipo_programa_pan = TipoPrograma.create! nombre: 'PAN'
tipo_programa_comunicaciones = TipoPrograma.create! nombre: 'Comunicaciones'
tipo_programa_obra_civil = TipoPrograma.create! nombre: 'Obra civil'

tipo_programa_vias.tareas   << tareas_vias
tipo_programa_vias.recursos << recursos_vias

tipo_programa_puentes.tareas << tareas_puentes
tipo_programa_puentes.recursos << recursos_puentes

puts 'SEEDS COMPLETO'
puts ''
