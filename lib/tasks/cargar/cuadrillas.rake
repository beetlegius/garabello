namespace :cargar do
  task cuadrillas: :environment do
    puts 'Creando cuadrillas...'
    Cuadrilla.create! [
      { nombre: 'Vías - Brandsen 14+2', sector: Cuadrilla::NORTE, tipo_programa_id: 1 },
      { nombre: 'Vías - Chascomús 12+2', sector: Cuadrilla::NORTE, tipo_programa_id: 1 },
      { nombre: 'Vías - Dolores 6+1', sector: Cuadrilla::NORTE, tipo_programa_id: 1 },
      { nombre: 'Vías - Maipú 10+2', sector: Cuadrilla::SUR, tipo_programa_id: 1 },
      { nombre: 'Vías - Vidal 10+2', sector: Cuadrilla::SUR, tipo_programa_id: 1 },
      { nombre: 'Vías - MDQ 4+1', sector: Cuadrilla::SUR, tipo_programa_id: 1 },
      { nombre: 'Señalamiento mecánico - Chascomús 4+1', sector: Cuadrilla::NORTE, tipo_programa_id: 2 },
      { nombre: 'Señalamiento eléctrico - Chascomús 2+1', sector: Cuadrilla::NORTE, tipo_programa_id: 2 },
      { nombre: 'Señalamiento mecánico - Mar del Plata 4+1', sector: Cuadrilla::SUR, tipo_programa_id: 2 },
      { nombre: 'Señalamiento eléctrico - Mar del Plata 2+1', sector: Cuadrilla::SUR, tipo_programa_id: 2 },
      { nombre: 'Comunicaciones - Lezama 2+2', sector: Cuadrilla::NORTE, tipo_programa_id: 3 },
      { nombre: 'Comunicaciones - Maipú 1+1', sector: Cuadrilla::NORTE, tipo_programa_id: 3 },
      { nombre: 'Comunicaciones - Vidal 1+1', sector: Cuadrilla::SUR, tipo_programa_id: 3 },
      { nombre: 'Puentes - Gral Guido 4+1', sector: Cuadrilla::NORTE, tipo_programa_id: 4 },
      { nombre: 'Puentes operadores de equipos - Gral Guido 7+2', sector: Cuadrilla::NORTE, tipo_programa_id: 4 },
      { nombre: 'Obras civiles - Escalada 7+2', sector: Cuadrilla::NORTE, tipo_programa_id: 5 },
      { nombre: 'Obras civiles volante desmalezado estaciones - Escalada 6+2', sector: Cuadrilla::NORTE, tipo_programa_id: 5 },
    ]

    puts 'Creando empleados...'
    for cuadrilla in Cuadrilla.all
      cantidad1 = cuadrilla.nombre.split(" ").last.split("+").first.to_i
      cantidad2 = cuadrilla.nombre.split(" ").last.split("+").last.to_i
      (cantidad1 + cantidad2).times do |i|
        cuadrilla.empleados.create! nombre: Faker::Name.first_name, apellido: Faker::Name.last_name
      end
    end

  end
end
