namespace :cargar do

  task estructuras: :environment do
    puts 'Cargando estructuras...'

    ramal = Ramal.first
    estaciones = Estacion.last.higher_items

    40.times do |i|
      estacion_anterior = estaciones.sample
      estacion_siguiente = estacion_anterior.lower_item

      material = Estructura::MATERIALES.sample

      estructura = Puente.create! km: rand(0.0..400.0),
        tipo: Estructura::TIPOS.sample,
        estacion_anterior: estacion_anterior,
        estacion_siguiente: estacion_siguiente,
        partido: estacion_anterior.nombre,
        localidad: estacion_anterior.nombre,
        cantidad_tableros: rand(1..2),
        tipo_tablero: Estructura::TIPOS_TABLERO.sample,
        material_tableros: material,
        material_estribos: material,
        material_pilares: material,
        ramal: ramal

      tipo_seccion = ["Tramo", "Tramo", "Tramo", "Tubo"].sample
      diametro = [50, 60, 70, 80, 90].sample
      rand(1..3).times do
        case tipo_seccion
        when "Tramo"
          metros = rand(3..20)
          luz = metros - 2
          estructura.secciones << Tramo.new(metros: metros, luz: luz)
        when "Tubo"
          estructura.secciones << Tubo.new(diametro: diametro)
        end
      end

      estructura.secciones.count.pred.times do
        estructura.pilares.create!
      end

    end
  end
end
