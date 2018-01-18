namespace :cargar do
  task programas: :environment do

    puts 'Inicializando variables...'

    nombres     = Empleado.all.map(&:nombre_completo)
    ramales     = Ramal.all
    cuadrillas  = Cuadrilla.includes(:empleados)
    users       = User.all
    capataces   = nombres
    inspectores = nombres

    49.downto(0) do |i|
      puts 'Creando programa...'
      tipo_programa = TipoPrograma.where(id: [1, 2]).sample
      tareas        = tipo_programa.tareas
      recursos      = tipo_programa.recursos
      cuadrilla = cuadrillas.sample
      ramal       = ramales.sample
      desde     = i.weeks.ago.beginning_of_week.to_date
      hasta     = (desde + 4.days).to_date
      capataz   = capataces.sample
      inspector = inspectores.sample
      trabajos_pam = []
      trabajos_pat = []
      trabajos_fp  = []
      consumos     = []
      asistencias  = []

      programa = tipo_programa.programas.create! desde: desde, hasta: hasta,
        capataz: capataz, inspector: inspector,
        observaciones: [Faker::Lorem.paragraph, nil, nil].sample, cuadrilla: cuadrilla, ramal: ramal, user: users.sample


      km_desde = i.next * 100
      km_hasta = km_desde + 5
      for jornada in programa.jornadas
        km_desde += 5
        km_hasta += 5
        jornada.update! km_desde: km_desde, km_hasta: km_hasta

        tareas_disponibles = tareas.shuffle
        rand(2..10).times do
          cantidad_estimada = rand(1..10)
          trabajo = TrabajoPAM.new(tarea: tareas_disponibles.pop, cantidad_estimada: cantidad_estimada, cantidad_ejecutada: [cantidad_estimada, cantidad_estimada - 1, cantidad_estimada - 2].sample)
          trabajo.asociar_jornada(jornada)
          trabajos_pam.push trabajo
        end

        tareas_disponibles = tareas.shuffle
        rand(0..5).times do
          cantidad_estimada = rand(1..10)
          trabajo = TrabajoPAT.new(tarea: tareas_disponibles.pop, cantidad_estimada: cantidad_estimada, cantidad_ejecutada: [cantidad_estimada, cantidad_estimada - 1, cantidad_estimada - 2].sample)
          trabajo.asociar_jornada(jornada)
          trabajos_pat.push trabajo
        end

        tareas_disponibles = tareas.shuffle
        rand(0..1).times do
          cantidad_ejecutada = rand(1..10)
          km_desde_puntual = km_desde + rand(50)
          trabajo = TrabajoFP.new(tarea: tareas_disponibles.pop, km_desde: km_desde_puntual, km_hasta: km_desde_puntual + 5, cantidad_ejecutada: cantidad_ejecutada)
          trabajo.asociar_jornada(jornada)
          trabajos_fp.push trabajo
        end

        recursos_disponibles = recursos.shuffle
        rand(10..15).times do
          cantidad = rand(10..100)
          consumo = Consumo.new(recurso: recursos_disponibles.pop, cantidad: cantidad)
          consumo.asociar_jornada(jornada)
          consumos.push consumo
        end
      end

      programa.trabajos_pam << trabajos_pam#.map { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
      programa.trabajos_pat << trabajos_pat#.map { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
      programa.trabajos_fp  << trabajos_fp#.map  { |t| t.asociar_jornada programa.jornadas.detect { |j| j.fecha == t.fecha }; t }
      programa.consumos     << consumos

      programa.asistencias.update_all estado: Asistencia::PRESENTE
      programa.asistencias.reorder("RANDOM()").limit(cuadrilla.empleados_count / rand(4..5)).update_all estado: Asistencia::AUSENTE
      programa.asistencias.reorder("RANDOM()").limit(4).update_all estado: Asistencia::AUSENTE_SIN_AVISO
      programa.asistencias.reorder("RANDOM()").where(empleado_id: cuadrilla.empleados.sample).update_all estado: Asistencia::SIN_ASIGNAR if rand(5..10) > 7
      programa.asistencias.where(estado: Asistencia::PRESENTE).reorder("RANDOM()").limit(10).each { |asistencia| asistencia.update! recargo_horas: rand(1..4) }
    end

    puts 'Todo salió como se esperaba!'

  end
end
