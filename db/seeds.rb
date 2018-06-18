# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genero.create(descricao: 'masculino')
Genero.create(descricao: 'feminino')

Perfil.create(descricao: 'admin')
Perfil.create(descricao: 'android')
Perfil.create(descricao: 'prefeitura')

Escolaridade.create(descricao: 'Fundamental incompleto')
Escolaridade.create(descricao: 'Fundamental completo')
Escolaridade.create(descricao: 'Medio incompleto')
Escolaridade.create(descricao: 'Medio completo')
Escolaridade.create(descricao: 'Superior incompleto')
Escolaridade.create(descricao: 'Superior completo')

Usuario.create(perfil_id: 1, escolaridade_id: 6, genero_id: 1, nome: 'Admin', email: 'admin@email.com', password: '123123', password_confirmation: '123123', profissao: 'Administrador', ano: 1990)
Usuario.create(perfil_id: 2, escolaridade_id: 5, genero_id: 2, nome: 'Guria', email: 'guria@email.com', password: '123123', password_confirmation: '123123', profissao: 'Android', ano: 1995)
Usuario.create(perfil_id: 3, escolaridade_id: 4, genero_id: 1, nome: 'Pia',   email: 'pia@email.com',   password: '123123', password_confirmation: '123123', profissao: 'Prefeitura', ano: 1998)

Dificuldade.create(nome: 'nenhuma')

TipoMarcacao.create(descricao: 'rampa')
TipoMarcacao.create(descricao: 'calcada')

descricoes_probs = [
  'Rebaixamento com defeito',
  'Buraco',
  'Obras',
  'Calçada sem rebaixamento',
  'Calçada estreita',
  'Ausência de calçada',
  'Calçada irregular',
  'Rebaixamento quebrado',
  'Obstaculo na calçada'
]

pontos = [
  [-25.443418, -49.281394],
  [-25.442378, -49.282611],
  [-25.441823, -49.270954],
  [-25.443732, -49.271262],
  [-25.444145, -49.271039],
  [-25.444086, -49.256146],
  [-25.427412, -49.252224],
  [-25.427351, -49.253019],
  [-25.429852, -49.252122],
  [-25.430327, -49.252905],
  [-25.431846, -49.256441],
  [-25.431798, -49.257699],
  [-25.431817, -49.258812],
  [-25.431691, -49.258992],
  [-25.431613, -49.262161],
  [-25.431364, -49.262023],
  [-25.431217, -49.262337],
  [-25.430658, -49.262577],
  [-25.429974, -49.262677],
  [-25.427678, -49.262478],
  [-25.427799, -49.265260],
  [-25.428311, -49.265653],
  [-25.428220, -49.266153],
  [-25.428634, -49.268230],
  [-25.430983, -49.268763],
  [-25.431730, -49.270361],
  [-25.432132, -49.271337],
  [-25.436273, -49.272574],
  [-25.436202, -49.272431],
  [-25.440265, -49.269349],
  [-25.443548, -49.272627],
  [-25.445496, -49.287610],
  [-25.444488, -49.287978],
  [-25.444960, -49.289821],
  [-25.470400, -49.283920],
  [-25.467184, -49.283743],
  [-25.468371, -49.293608],
  [-25.467846, -49.292921],
  [-25.470768, -49.294727],
  [-25.469736, -49.295498],
  [-25.469202, -49.296146],
  [-25.467571, -49.298482],
  [-25.467487, -49.299552],
  [-25.467932, -49.298673],
  [-25.467882, -49.298160],
  [-25.407675, -49.249985],
  [-25.406989, -49.249704],
  [-25.406633, -49.251168],
  [-25.407106, -49.251166],
  [-25.407166, -49.252568],
  [-25.407019, -49.254432],
  [-25.407653, -49.254800],
  [-25.408040, -49.255366],
  [-25.409561, -49.254315],
  [-25.409421, -49.253773],
  [-25.410579, -49.253891],
  [-25.411599, -49.252349],
  [-25.410644, -49.251268],
  [-25.416138, -49.268148],
  [-25.416012, -49.266394],
  [-25.414423, -49.269902],
  [-25.415387, -49.270954],
  [-25.411520, -49.271029],
  [-25.410435, -49.271431],
  [-25.407140, -49.269484],
  [-25.407358, -49.271560],
  [-25.407915, -49.268685],
  [-25.411903, -49.269897],
  [-25.416060, -49.270106],
  [-25.422780, -49.269532],
  [-25.423328, -49.267977],
  [-25.425106, -49.271388],
  [-25.425842, -49.271673],
  [-25.423502, -49.267612],
  [-25.422146, -49.266303],
  [-25.426269, -49.261518],
  [-25.425658, -49.262054],
  [-25.427407, -49.262129],
  [-25.428991, -49.261330],
  [-25.440381, -49.278281],
  [-25.441563, -49.280438],
  [-25.442594, -49.283045],
  [-25.440982, -49.283636],
  [-25.441670, -49.285530],
  [-25.442392, -49.285245],
  [-25.443046, -49.284977],
  [-25.446485, -49.285857],
  [-25.450253, -49.281769],
  [-25.447701, -49.278803],
  [-25.446737, -49.276292],
  [-25.444237, -49.275085],
  [-25.437755, -49.275938],
  [-25.437816, -49.276571],
  [-25.435837, -49.276093],
  [-25.433873, -49.276182],
  [-25.437882, -49.271855],
  [-25.441370, -49.272284],
  [-25.441802, -49.268709],
  [-25.443155, -49.271550],
  [-25.444319, -49.275229],
  [-25.446026, -49.279634],
  [-25.444461, -49.280324]
]

def rand_int(from, to)
  rand_in_range(from, to).to_i
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

def cria_problemas(pontos, descricoes)
  pontos.each do |ponto|
    params = {
      usuario_id: 2,
      tipo_marcacao_id: rand_int(1, 2),
      lat_inicio: ponto[0],
      long_inicio: ponto[1],
      lat_final: ponto[0],
      long_final: ponto[1],
      descricao: descricoes[rand_int(0, 8)]
    }
    prob = Problema.create(params)
    prob.update_attributes(data_hora_reporte: rand_time(2.years.ago))
  end
end

def cria_solucoes
  descricoes_solu = [
    'Calçada concertada',
    'Rebaixamento concertado',
    'Obstáculo removido',
    'Obra finalizada',
    'Calçada alinhada'
  ]
  n_problemas = Problema.count
  problemas_ids = Problema.all.limit(n_problemas / 3).map(&:id)
  problemas_ids.each do |problema_id|
    solucao = Solucao.create(
      problema_id: problema_id,
      resultado_id: 1,
      usuario_id: rand_int(2, 4),
      descricao: descricoes_solu[rand_int(0, 5)]
    )
    solucao.update_attributes(
      data_hora: rand_time(solucao.problema.data_hora_reporte)
    )
  end
end
