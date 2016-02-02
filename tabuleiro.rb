class Tabuleiro

  attr_reader :jogador1, :jogador2, :quem_joga, :quem_venceu

  def initialize
    jogadas_vencedoras
    inicia_jogador
    set_quem_joga 1
  end

  def inicializa_tabuleiro
    @tabuleiro = Hash.new
    for posicao in 1..9
      @tabuleiro[posicao] = 0
    end
  end

  def inicia_jogador
    @jogador1 = {nome: "Jogador 1", jogadas: []}
    @jogador2 = {nome: "Jogador 1", jogadas: []}

    @quem_venceu = nil
  end


  def jogadas_vencedoras
    #possiveis jogadas vencedoras
    @vencedor = [[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9],
                 [1, 4, 7],
                 [2, 5, 8],
                 [3, 6, 9],
                 [1, 5, 9],
                 [3, 5, 7]]

  end

  def verifica_se_jogador_ganhou(jogador)
    @vencedor.each do |row|
      if verifica_jogada_ganhadora(row, jogador)
        @quem_venceu = jogador
        return true
      end
    end
    false
  end

  def verifica_jogada_ganhadora(linha, jogador)
    tem = 0
    linha.each do |i|
      if jogador[:jogadas].include? i
        tem += 1
      end
    end
    tem == 3
  end

  def has_vencedor
    verifica_se_jogador_ganhou(@jogador1) || verifica_se_jogador_ganhou(@jogador2)
  end


  def inicia_posicao
    @posicao[1] = [0, 0];
  end

  def set_quem_joga(quem_joga)
      @quem_joga = quem_joga
  end


  def muda_jogada_para_outro
    if @quem_joga == 1
      set_quem_joga 2
    else
      set_quem_joga 1
    end
  end

  def jogador1
    @jogador1
  end

  def jogador2
    @jogador2
  end

  def quem_joga
    @quem_joga
  end

  def pode_jogar(num)
    if num < 1 || num > 9
      return false
    end

     return false if (@jogador1[:jogadas] + @jogador2[:jogadas]).include?num
     return true
  end

  def faz_jogada(jogador, num)
    if pode_jogar(num)
      jogador[:jogadas] << num
    else
      puts "Jogada #{num} já foi jogada ou não permitida, faca novamente"
      faz_jogada(jogador, gets.chomp.to_i)
    end

  end

  def play
    until has_vencedor
      puts "Jogador #{@quem_joga}, faça sua jogada"
      if @quem_joga == 1
        faz_jogada(@jogador1, gets.chomp.to_i)
      else
        faz_jogada(@jogador2, gets.chomp.to_i)
      end
      muda_jogada_para_outro
    end
    puts "Quem venceu foi o jogador: #{@quem_venceu[:nome]}"
  end
end