task programas: :environment do

  puts 'Inicializando variables...'

  nombres     = Empleado.all.map(&:nombre_completo)
  vias        = Via.all
  cuadrillas  = Cuadrilla.includes(:empleados)
  tareas      = Tarea.all
  recursos    = Recurso.all
  capataces   = nombres
  inspectores = nombres

  20.downto(0) do |i|
    puts 'Creando programa...'
    cuadrilla = cuadrillas.sample
    via       = vias.sample
    desde     = i.weeks.ago.beginning_of_week.to_date
    hasta     = (desde + 4.days).to_date
    capataz   = capataces.sample
    inspector = inspectores.sample
    trabajos_pam = []
    trabajos_pat = []
    trabajos_fp  = []
    consumos     = []
    asistencias  = []

    for dia in (desde..hasta)
      km_desde = rand(0..400)
      km_hasta = km_desde + rand(10)
      tareas_disponibles = tareas.shuffle
      rand(0..3).times do
        cantidad_estimada = rand(10)
        trabajos_pam.push TrabajoPAM.new(fecha: dia, tarea: tareas_disponibles.pop, cantidad_estimada: cantidad_estimada, cantidad_ejecutada: [cantidad_estimada, cantidad_estimada - 1, cantidad_estimada - 2].sample)
      end
      tareas_disponibles = tareas.shuffle
      rand(0..3).times do
        cantidad_estimada = rand(10)
        trabajos_pat.push TrabajoPAT.new(fecha: dia, tarea: tareas_disponibles.pop, km_desde: km_desde, km_hasta: km_hasta, cantidad_estimada: cantidad_estimada, cantidad_ejecutada: [cantidad_estimada, cantidad_estimada - 1, cantidad_estimada - 2].sample)
      end
      tareas_disponibles = tareas.shuffle
      rand(0..1).times do
        cantidad_ejecutada = rand(10)
        trabajos_fp.push TrabajoFP.new(fecha: dia, tarea: tareas_disponibles.pop, km_desde: km_desde, km_hasta: km_hasta, cantidad_ejecutada: cantidad_ejecutada)
      end
      recursos_disponibles = recursos.shuffle
      rand(6..10).times do
        cantidad = rand(10..100)
        consumos.push Consumo.new(fecha: dia, recurso: recursos_disponibles.pop, km_desde: km_desde, km_hasta: km_hasta, cantidad: cantidad)
      end
    end

    programa = Programa.create! desde: desde, hasta: hasta,
      capataz: capataz, inspector: inspector,
      dotacion_original: cuadrilla.empleados_count, dotacion_real: [cuadrilla.empleados_count, cuadrilla.empleados_count - 1, cuadrilla.empleados_count - 2].sample,
      observaciones: [Faker::Lorem.paragraph, nil, nil].sample, cuadrilla: cuadrilla, via: via

    km_desde = i.next * 100
    km_hasta = km_desde + 5
    for jornada in programa.jornadas
      jornada.update! km_desde: km_desde, km_hasta: km_hasta
      km_desde += 5
      km_hasta += 5
    end

    programa.trabajos_pam << trabajos_pam.map { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
    programa.trabajos_pat << trabajos_pat.map { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
    programa.trabajos_fp  << trabajos_fp.map  { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
    programa.consumos     << consumos

    programa.asistencias.update_all estado: Asistencia::PRESENTE
    programa.asistencias.reorder("RANDOM()").limit(cuadrilla.empleados_count / rand(4..5)).update_all estado: Asistencia::AUSENTE
    programa.asistencias.reorder("RANDOM()").limit(4).update_all estado: Asistencia::AUSENTE_SIN_AVISO
    programa.asistencias.where(estado: Asistencia::PRESENTE).reorder("RANDOM()").limit(10).each { |asistencia| asistencia.update! recargo_horas: rand(1..4) }
  end

  puts 'Todo salió como se esperaba!'

end
