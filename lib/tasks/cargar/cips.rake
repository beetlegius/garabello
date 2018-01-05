namespace :cargar do
  task cips: :environment do

    puts 'Creando CIPs...'
    Cip.create! [
      { codigo: "211", nombre: "Productos Alimenticios" },
      { codigo: "221", nombre: "Ropa de Trabajo y Elementos de Seguridad Industrial" },
      { codigo: "231", nombre: "Libros, Revistas y Periodicos" },
      { codigo: "232", nombre: "Insumos de Oficina" },
      { codigo: "233", nombre: "Insumos de Informática" },
      { codigo: "239", nombre: "Otros Papel, Carton e Impresos N.E.P." },
      { codigo: "251", nombre: "Insecticidas, fumigantes y otros" },
      { codigo: "252", nombre: "Tintas, Pinturas y Colorantes" },
      { codigo: "253", nombre: "Combustibles y Lubricantes" },
      { codigo: "254", nombre: "Insumos de Limpieza" },
      { codigo: "259", nombre: "Otros Quimicos, Combustibles y Lubricantes N.E.P." },
      { codigo: "272", nombre: "Herramientas Menores" },
      { codigo: "291", nombre: "Insumos, Repuestos y Accesorios - Taller" },
      { codigo: "292", nombre: "Repuestos y Accesorios - Material Rodante Tractivo" },
      { codigo: "293", nombre: "Repuestos y Accesorios - Material Rodante Remolcado" },
      { codigo: "294", nombre: "Repuestos y Accesorios - Material Rodante Electrico" },
      { codigo: "295", nombre: "Repuestos y Accesorios - Infraestructura Electrica" },
      { codigo: "296", nombre: "Repuestos y Accesorios - Señalamiento y Comunicaciones" },
      { codigo: "297", nombre: "Repuestos y Accesorios - Vias e infraestructura" },
      { codigo: "299", nombre: "Otros Insumos, Repuestos y Accesorios NEP" },
      { codigo: "311", nombre: "Energía Eléctrica - electricidad" },
      { codigo: "312", nombre: "Agua" },
      { codigo: "313", nombre: "Gas" },
      { codigo: "314", nombre: "Telefono" },
      { codigo: "315", nombre: "Correo y Comunicaciones" },
      { codigo: "316", nombre: "Energia Electrica - Traccion" },
      { codigo: "319", nombre: "Otros Servicios Basicos N.E.P." },
      { codigo: "321", nombre: "Alquiler de Edificios y Locales" },
      { codigo: "322", nombre: "Alquiler de Maquinaria, Equipo y Medios de Transporte" },
      { codigo: "324", nombre: "Alquiler de Fotocopiadoras" },
      { codigo: "329", nombre: "Otros Alquileres y Derechos N.E.P." },
      { codigo: "331", nombre: "Mantenimiento y Reparación de Edificios y Locales" },
      { codigo: "332", nombre: "Mantenimiento y Reparación de Vehículos" },
      { codigo: "333", nombre: "Mantenimiento y Reparación de Maquinaria y Equipo" },
      { codigo: "334", nombre: "Mantenimiento y Reparacion de Señales y Telecomunicaciones" },
      { codigo: "335", nombre: "Mantenimiento y Reparacion de Material Rodante Tractivo" },
      { codigo: "336", nombre: "Mantenimiento y Reparacion de Material Rodante Remolcado" },
      { codigo: "337", nombre: "Mantenimiento y Reparacion de Material Rodante Electrico" },
      { codigo: "338", nombre: "Mantenimiento de Vias e Infraestructura" },
      { codigo: "339", nombre: "Otros Servicios de Mant., Rep. Y Limpieza N.E.P." },
      { codigo: "341", nombre: "Estudios, Investigaciones y Proyectos de Factibilidad" },
      { codigo: "342", nombre: "Médicos y Sanitarios" },
      { codigo: "344", nombre: "Contabilidad y Auditoría" },
      { codigo: "345", nombre: "De Capacitación" },
      { codigo: "346", nombre: "De Informática y Sistemas Computarizados" },
      { codigo: "347", nombre: "Servicio de Recaudación - Recolección de Caudales" },
      { codigo: "349", nombre: "Otros Servicios Tecnicos y Profesionales N.E.P." },
      { codigo: "351", nombre: "Transporte" },
      { codigo: "353", nombre: "Imprenta, Publicaciones y Reproducciones" },
      { codigo: "354", nombre: "Primas y Gastos de Seguros" },
      { codigo: "356", nombre: "Internet" },
      { codigo: "357", nombre: "Limpieza, Aseo y Fumigación" },
      { codigo: "358", nombre: "Transporte en Omnibus / Colectivos" },
      { codigo: "359", nombre: "Otros Servicios Comerciales N.E.P." },
      { codigo: "361", nombre: "Publicidad y Propaganda" },
      { codigo: "371", nombre: "Pasajes" },
      { codigo: "372", nombre: "Viáticos" },
      { codigo: "373", nombre: "Acuerdos de Operación" },
      { codigo: "379", nombre: "Otros Gastos de Traslado N.E.P." },
      { codigo: "391", nombre: "Servicios de Vigilancia provista por fuerzas de Seguridad Pública" },
      { codigo: "392", nombre: "Gastos Protocolares" },
      { codigo: "394", nombre: "Servicios de Vigilancia provista por fuerzas de Seguridad Privada" },
      { codigo: "395", nombre: "Seguridad Operacional, mantenimiento de CCTV" },
      { codigo: "399", nombre: "Otros Servicios N.E.P." },
      { codigo: "412", nombre: "Edificios e Instalaciones" },
      { codigo: "421", nombre: "Construcciones en Bienes de Dominio Privado" },
      { codigo: "431", nombre: "Maquinaria y Equipo de Producción" },
      { codigo: "432", nombre: "Material Rodante Tractivo" },
      { codigo: "433", nombre: "Material Rodante Remolcado" },
      { codigo: "434", nombre: "Vehiculos Automotores" },
      { codigo: "435", nombre: "Equipo de Comunicación y Señalamiento" },
      { codigo: "436", nombre: "Equipo para Computación" },
      { codigo: "437", nombre: "Equipo de Oficina y Muebles" },
      { codigo: "438", nombre: "Herramientas y Repuestos Mayores" },
      { codigo: "439", nombre: "Equipos Varios" },
      { codigo: "481", nombre: "Programas de Computación" }
    ]

  end
end
