namespace :cargar do

  task relevamientos: :environment do
    puts 'Cargando relevamientos...'

    estados = %w(bueno bueno bueno bueno regular regular malo)
    fechas = Date.new(2017,11,1)..Date.new(2018,1,30)

    for estructura in Estructura.all
      relevamiento = estructura.relevamientos.create! fecha: rand(fechas),
        estado_bulones_de_amarre: estados.sample,
        estado_contra_rieles: estados.sample,
        estado_tacos_de_madera: estados.sample,
        estado_nivelacion_de_cabeceras: estados.sample,
        estado_durmientes: estados.sample,
        estado_pintura: estados.sample,
        estado_mamposteria_muro_lateral_ascendente: estados.sample,
        estado_mamposteria_muro_lateral_descendente: estados.sample,
        estado_mamposteria_muro_frontal_ascendente: estados.sample,
        estado_mamposteria_muro_frontal_descendente: estados.sample,
        estado_mamposteria_zapatas_ascendente: estados.sample,
        estado_mamposteria_zapatas_descendente: estados.sample,
        estado_vegetacion_muro_lateral_ascendente: estados.sample,
        estado_vegetacion_muro_lateral_descendente: estados.sample,
        estado_vegetacion_muro_frontal_ascendente: estados.sample,
        estado_vegetacion_muro_frontal_descendente: estados.sample,
        estado_vegetacion_zapatas_ascendente: estados.sample,
        estado_vegetacion_zapatas_descendente: estados.sample,
        estado_taludes_margen_izquierda_aguas_arriba: estados.sample,
        estado_taludes_margen_derecha_aguas_arriba: estados.sample,
        estado_taludes_margen_izquierda_aguas_abajo: estados.sample,
        estado_taludes_margen_derecha_aguas_abajo: estados.sample,
        estado_defensas_estribos_ascendente: estados.sample,
        estado_defensas_estribos_descendente: estados.sample,
        estado_cauce: estados.sample,
        observaciones_cauce: Faker::Lorem.sentence,
        observaciones_generales: Faker::Lorem.paragraph

      for seccion in estructura.secciones
        relevamiento.estados_seccion.create! estado: estados.sample, observaciones: [Faker::Lorem.sentence, nil, nil].sample, seccion: seccion
      end

      for pilar in estructura.pilares
        relevamiento.estados_pilar.create! estado: estados.sample, observaciones: [Faker::Lorem.sentence, nil, nil].sample, pilar: pilar
      end

      puts "Cargando fotos relevamiento #{relevamiento.id}..."
      6.times do |i|
        puts "Cargando foto #{i.next}"
        relevamiento.fotos.create! imagen_url: 'https://picsum.photos/50/?random'
      end
    end

  end
end
