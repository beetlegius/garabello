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

puts 'Creando tareas...'
Tarea.create! nombre: "Tapar", unidad: 'metro'
Tarea.create! nombre: "Destapar", unidad: 'metro'
Tarea.create! nombre: "Ajuste y reemplazo de fijaciones", unidad: 'metro'
Tarea.create! nombre: "Cambio de durmientes", unidad: 'unidad'
Tarea.create! nombre: "Escuadrar durmientes", unidad: 'unidad'
Tarea.create! nombre: "Tratamiento de juntas", unidad: 'unidad'
Tarea.create! nombre: "Reemplazo de rieles", unidad: 'metro'
Tarea.create! nombre: "Conservacion geométrica manual", unidad: 'metro'
Tarea.create! nombre: "Tareas de conservación ADV", unidad: 'unidad'
Tarea.create! nombre: "Desmalezado, desmonte, carpir", unidad: 'metro_2'
Tarea.create! nombre: "Nivelación longitudinal", unidad: 'metro'
Tarea.create! nombre: "Nivelación de juntas", unidad: 'unidad'
Tarea.create! nombre: "Alinear vía", unidad: 'metro'
Tarea.create! nombre: "Perfilar (zanja, tajeas)", unidad: 'metro'
Tarea.create! nombre: "Corrección de trocha", unidad: 'metro'
Tarea.create! nombre: "Tareas de vía en PaNs", unidad: 'unidad'
Tarea.create! nombre: "Manipuleo, carga y descarga de materiales", unidad: 'tonelada'
Tarea.create! nombre: "Limpieza lugar de trabajo y reparación de herramientas", unidad: 'hora'
Tarea.create! nombre: "Traslado base a obradores", unidad: 'kilometro'

puts 'Creando recursos...'
Recurso.create! nombre: 'Durmiente', unidad: 'unidad'
Recurso.create! nombre: 'Bulón para eclisa', unidad: 'unidad'
Recurso.create! nombre: 'Arandela grower', unidad: 'unidad'
Recurso.create! nombre: 'Tirafondos para vía', unidad: 'unidad'
Recurso.create! nombre: 'Eclisa para riel', unidad: 'unidad'
Recurso.create! nombre: 'Riel', unidad: 'metro'
Recurso.create! nombre: 'Mecha para durmientes', unidad: 'unidad'
Recurso.create! nombre: 'Disco de corte', unidad: 'unidad'
Recurso.create! nombre: 'Balasto', unidad: 'tonelada'
Recurso.create! nombre: 'Aceite', unidad: 'litro'
Recurso.create! nombre: 'Tanza', unidad: 'metro'
Recurso.create! nombre: 'Grasa', unidad: 'kilo'
Recurso.create! nombre: 'Nafta moto - herramientas', unidad: 'litro'
Recurso.create! nombre: 'Nafta zorra - movilidad', unidad: 'litro'
Recurso.create! nombre: 'Herbicida', unidad: 'litro'

puts 'SEEDS COMPLETO'
puts ''
