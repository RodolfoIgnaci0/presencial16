file = File.open('prueba.csv','r')
data = file.readlines.map(&:chomp)
file.close

alumnos_hash = {}
data.each do |i|
  alumnos_todos = i.split(', ')
  alumnos = [alumnos_todos[1], alumnos_todos[2],
    alumnos_todos[3], alumnos_todos[4], alumnos_todos[5]]
    alumnos_hash[alumnos_todos[0]] = alumnos
end

repetir = true
nota = 5.0
def menu
  puts "**** Menu ****"
  puts "1.- promedio alumnos"
  puts "2.- total inasistencias"
  puts "3.- nombre aprobados"
  puts "4.- salir \n"
end
def aprobacion(nota,data)
  puts "David aprobado" if nota <= data['David'].inject(0){|suma,i| suma + i.to_i}.to_f / 5
  puts "Gonzalo aprobado" if nota <= data['Gonzalo'].inject(0){|suma,i| suma + i.to_i}.to_f / 5
  puts "Mai aprobado" if nota <= data['Mai'].inject(0){|suma,i| suma + i.to_i}.to_f / 5
  puts "JP aprobado" if nota <= data['JP'].inject(0){|suma,i| suma + i.to_i}.to_f / 5
end

begin
  menu
  puts "ingresa opcion"
  opcion = gets.chomp

  case opcion
    when "1"
      file = File.open('Promedios.txt','w')
        file.puts "Promedio David: #{alumnos_hash['David'].inject(0){|suma,i| suma + i.to_i}.to_f / 5}"
        file.puts "Promedio Gonzalo: #{alumnos_hash['Gonzalo'].inject(0){|suma,i| suma + i.to_i}.to_f / 5}"
        file.puts "Promedio Mai: #{alumnos_hash['Mai'].inject(0){|suma,i| suma + i.to_i}.to_f / 5}"
        file.puts "Promedio JP: #{alumnos_hash['JP'].inject(0){|suma,i| suma + i.to_i}.to_f / 5}"
      file.close
    when "2"
      contador = 0
      alumnos_hash.each_value{|value|contador += 1 if value.include? 'A'}
      puts "Total de inasistencias es #{contador}"
    when "3"
      puts "Desea cambiar nota de aprobación, actualmente es de #{nota} - Si/No"
      opcion = gets.chomp.downcase
      if opcion == 'si'
        puts "ingrese nueva nota mínima de aprobación"
        nota = gets.chomp.to_f
      end
      aprobacion(nota,alumnos_hash)
    when "4"
      repetir = false
    else
      puts "opción invalida"
    end
end while repetir
