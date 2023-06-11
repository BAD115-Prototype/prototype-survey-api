$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'axlsx'

class ReportsController < ApplicationController

  def generate_excel
    
    encuesta_id = params[:encuesta_id]
    encuesta = Encuesta.find(encuesta_id)
    sql_query = "SELECT * FROM vista_preguntas_respuestas WHERE encuesta_id=%s" %[encuesta_id]
    sql_queryPreguntas = "SELECT pk_pregunta, texto_pregunta, tipo_pregunta_id FROM vista_preguntas_respuestas WHERE encuesta_id=%s" %[encuesta_id]
    results = ActiveRecord::Base.connection.execute(sql_query)
    resultspreguntas = ActiveRecord::Base.connection.execute(sql_queryPreguntas)
    filename = ''
    file_path = ''
    pkPreguntaPrev = 0
    cantPreguntas = 1

    # Genera el archivo Excel
    Axlsx::Package.new do |report|

      resultspreguntas.each do |pregunta|
        if (pregunta[0] != pkPreguntaPrev)
          
          report.workbook.add_worksheet(name: "Pregunta %s" %[cantPreguntas]) do |sheet|
            
            # Busca el tipo de pregunta y luego agrega el texto de la pregunta y el tipo de pregunta
            tipoPreg = TipoPregunta.find(pregunta[2])
            sheet.add_row ["Pregunta:", pregunta[1], "", "Tipo de pregunta:", tipoPreg.descripcion_tipo]
            sheet.column_widths nil, nil, 10, nil, nil
            sheet.add_row

            # Agrega los encabezados de columna
            if(pregunta[2] == 1 )
               # Si la pregunta es de tipo abierta coloca el encabezado de respuestas
              sheet.add_row ["Respuestas"]
            else
              # Si es de otro tipo agrega los campos de opcion respuesta y conteo
              sheet.add_row ["Opción de respuesta", "Conteo de opción de respuesta"]
            end
        
            results.each do |row|
              # Agrega los datos a las filas para una misma pregunta
              if(pregunta[0] == row[0])
                # Si la pregunta es de tipo abierta coloca el campo de respuesta
                if(pregunta[2] == 1)
                  sheet.add_row [row[6]]
                else
                  # Si es de otro tipo agrega los campos de opcion respuesta y conteo
                  sheet.add_row [row[4], row[5]]
                end
              end
            end

          end
          #Aumenta en 1 la cantidad de preguntas
          cantPreguntas = cantPreguntas+1
        end
        #Guarda el id de la pregunta actual para comparar con la siguiente pregunta
        pkPreguntaPrev = pregunta[0]
      end

      # Asignar nombre del archivo
      filename = encuesta.titulo_encuesta+"_resultados.xlsx"

      # Guardar el archivo temporalmente
      file_path = Rails.root.join('tmp', filename)
      report.serialize(file_path)
    end

    # Envía el archivo ar cliente
    send_file file_path, filename: filename, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  end
end