# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! name: 'Gustavo Molinari', email: 'info@beetlegius.com.ar', role: User::SUPERADMIN, password: 'beetlegius'
User.create! name: 'Esteban Suárez',   email: 'estebansuarezbue@gmail.com', role: User::SUPERADMIN, password: 'suarez'

5.times do
  Cuadrilla.create! nombre: Faker::Simpsons.character
end
Via.create! nombre: 'Mar del Plata'
Via.create! nombre: 'Rosario'
Via.create! nombre: 'Chaco'
Via.create! nombre: 'Tucumán'
Via.create! nombre: 'Bahía Blanca'
Via.create! nombre: 'Mendoza'

for cuadrilla in Cuadrilla.all
  rand(5..10).times do
    cuadrilla.empleados.create! nombre: Faker::Name.first_name, apellido: Faker::Name.last_name
  end
end

15.times do
  Recurso.create! nombre: Faker::Name.name, unidad: Recurso::UNIDADES.sample
end

Tarea.create! nombre: "Tapar", unidad: 'metro'
Tarea.create! nombre: "Destapar", unidad: 'metro'
Tarea.create! nombre: "Ajuste y reemplazo fijaciones", unidad: 'metro'
Tarea.create! nombre: "Cambio durmientes", unidad: 'unidad'
Tarea.create! nombre: "Escuadrar durmientes", unidad: 'unidad'
Tarea.create! nombre: "Tratamiento juntas", unidad: 'unidad'
Tarea.create! nombre: "Reemplazo rieles", unidad: 'metro'
Tarea.create! nombre: "Conservacion geométrica manual", unidad: 'metro'
Tarea.create! nombre: "Tareas conservación ADV", unidad: 'unidad'
Tarea.create! nombre: "Desmalezado, desmonte, carpir", unidad: 'metro_2'
Tarea.create! nombre: "Nivelación longitudinal", unidad: 'metro'
Tarea.create! nombre: "Nivelación de juntas", unidad: 'unidad'
Tarea.create! nombre: "Alinear vía", unidad: 'metro'
Tarea.create! nombre: "Perfilar (zanja, tajeas)", unidad: 'metro'
Tarea.create! nombre: "Corrección de trocha", unidad: 'metro'
Tarea.create! nombre: "Tareas de vía en PaNs", unidad: 'unidad'
Tarea.create! nombre: "Manipuleo, carga y descarga de materiales", unidad: 'toneladas'
Tarea.create! nombre: "Limpieza lugar de trabajo y reparación de herramientas", unidad: 'horas'
Tarea.create! nombre: "Traslado base a obradores", unidad: 'kilometro'
