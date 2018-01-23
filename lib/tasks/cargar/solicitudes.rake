namespace :cargar do
  task solicitudes: :environment do

    Solicitud.destroy_all

    lugares = ["Materiales", "Gerencia general", "Abastecimiento", "Sistemas"]
    producto_ids = Producto.search(codigo_cont: 'NUM').result(distinc: true).pluck(:id)
    user_ids = User.pluck(:id)

    puts 'Creando solicitudes...'
    (50.days.ago.to_date..Date.today).each do |fecha|
      solicitud = Solicitud.create! fecha: fecha, lugar: lugares.sample, codigo_requerimiento: rand(20000..30000), categoria: Solicitud::CATEGORIAS.sample, estado: Solicitud::ESTADOS.sample, urgencia: Solicitud::URGENCIAS.sample

      rand(1..25).times do
        solicitud.items.create! cantidad: rand(1..200), producto_id: producto_ids.sample
      end

      rand(1..10).times do
        solicitud.novedades.create! fecha: rand(fecha..Date.today), contenido: Faker::Lorem.paragraph, user_id: user_ids.sample
      end

    end

    puts 'Listo!'

  end
end
