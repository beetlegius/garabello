namespace :cargar do

  task estaciones: :environment do
    puts 'Cargando estaciones...'
    ramal = Ramal.first
    ramal.estaciones.create! [
      { nombre: 'Constitución' },
      { nombre: 'Coronel Brandsen' },
      { nombre: 'Chascomús' },
      { nombre: 'Lezama' },
      { nombre: 'Castelli' },
      { nombre: 'Sevigné' },
      { nombre: 'Dolores' },
      { nombre: 'General Guido' },
      { nombre: 'Maipú' },
      { nombre: 'Las Armas' },
      { nombre: 'General Pirán' },
      { nombre: 'Coronel Vidal' },
      { nombre: 'Vivoratá' },
      { nombre: 'Mar del Plata' }
    ]
  end
end
