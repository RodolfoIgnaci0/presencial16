file = File.open('prueba.csv','r')
data = file.readlines.map(&:chomp)
file.close

repetir = true
def menu
  puts "**** Menu ****"
  puts "1.- promedio alumnos"
  puts "2.- total inasistencias"
  puts "3.- nombre aprobados"
  puts "4.- salir \n"
end


def aprobados(data)
  puts "nota aprobacion actual es 5.0, desea cambiar si/no"
  cambio_aprobacion = gets.chomp.downcase
  if cambio_aprobacion == "si"
    puts "ingrese nota minima para aprobar"
    nota_aprobacion = gets.chomp.to_f
  else
    nota_aprobacion = 5.0
  end

  david = data[0].split(', ')
  promedio_d = ((david[1].to_i + david[2].to_i + david[3].to_i + david[4].to_i + david[5].to_i) / 5.0).to_f
  puts "#{david[0]} aprobado con promedio #{promedio_d}" if promedio_d.to_f > nota_aprobacion

  gonzalo = data[1].split(', ')
  promedio_g = ((gonzalo[1].to_i + gonzalo[2].to_i + gonzalo[3].to_i + gonzalo[4].to_i + gonzalo[5].to_i) / 5.0).to_f
  puts "#{gonzalo[0]} aprobado con promedio #{promedio_g}" if promedio_g.to_f > nota_aprobacion

  mai = data[2].split(', ')
  promedio_m = ((mai[1].to_i + mai[2].to_i + mai[3].to_i + mai[4].to_i + mai[5].to_i) / 5.0).to_f
  puts "#{mai[0]} aprobado con promedio #{promedio_m}" if promedio_m.to_f > nota_aprobacion

  jp = data[3].split(', ')
  promedio_jp = ((jp[1].to_i + jp[2].to_i + jp[3].to_i + jp[4].to_i + jp[5].to_i) / 5.0).to_f
  puts "#{jp[0]} aprobado con promedio #{promedio_jp}" if promedio_jp.to_f > nota_aprobacion
end


begin
menu
puts "ingresa opcion"
opcion = gets.chomp

case opcion
when "1"
  #promedios txt
  file = File.open('promedios.txt','w')
  david = data[0].split(', ')
  file.puts david[0]+", "+ + ((david[1].to_i + david[2].to_i + david[3].to_i + david[4].to_i + david[5].to_i) / 5.0).to_s

  gonzalo = data[1].split(', ')
  file.puts gonzalo[0]+", "+ + ((gonzalo[1].to_i + gonzalo[2].to_i + gonzalo[3].to_i + gonzalo[4].to_i + gonzalo[5].to_i) / 5.0).to_s

  mai = data[2].split(', ')
  file.puts mai[0]+", "+ + ((mai[1].to_i + mai[2].to_i + mai[3].to_i + mai[4].to_i + mai[5].to_i) / 5.0).to_s

  jp = data[3].split(', ')
  file.puts jp[0]+", "+ + ((jp[1].to_i + jp[2].to_i + jp[3].to_i + jp[4].to_i + jp[5].to_i) / 5.0).to_s
  file.close
  puts "Archivo creado"
  #fin promedios txt
when "2"
  #inicio inasistencias
  contador = 0
  data.each do |i|
    contador += 1 if i.include? 'A'
  end
  puts "Total de inasistencias es #{contador}"
  #termino inasistencias
when "3"
  aprobados(data)
when "4"
  repetir = false
else
  puts "opción invalida"
end
end while repetir
