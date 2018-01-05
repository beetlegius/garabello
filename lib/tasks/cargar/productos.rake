namespace :cargar do
  task productos: :environment do

    filename = 'productos.xlsx'
    puts "Cargando #{filename}..."
    excel = Roo::Excelx.new("public/shared/public/cargar/#{filename}")
    excel.default_sheet = excel.sheets.last

    columns = %w(codigo nombre cip_id unidad)
    slice = 3000

    cips = Cip.all

    excel.each(codigo: 'CODIGO', nombre: 'DESCRIPCIO', cip: 'CIP', unidad: 'UNIMED').each_slice(slice) do |grupo|
      productos = []
      grupo.each do |hash|
        next if hash[:codigo] == 'CODIGO'
        productos << [].tap do |producto|
          producto << hash[:codigo].to_s.strip
          producto << hash[:nombre].to_s.strip
          producto << cips.detect { |cip| cip.codigo.to_s == hash[:cip].to_s }&.id
          producto << hash[:unidad].to_s.strip
        end
      end
      puts 'Importando productos...'
      Producto.import columns, productos
    end

  end
end
