class Fund
  attr_reader :codigo_fundo, :setor, :preco_atual, :liquidez_diaria, :dividendo, :dividend_yield, :dy_3m_acumulado, :dy_6m_acumulado, :dy_12m_acumulado, :dy_3m_media, :dy_6m_media, :dy_12m_media, :dy_ano, :variacao_preco, :rentabilidade_periodo, :rentabilidade_acumulada, :pat_liquido, :vpa, :p_s_vpa, :dy_patrimonial, :variacao_patrimonial, :rentab_pat_periodo, :rentab_pat_acumulada, :vacancia_fisica, :vacancia_financeira, :quantidade_ativos

  def initialize(codigo_fundo, setor, preco_atual, liquidez_diaria, dividendo, dividend_yield, dy_3m_acumulado, dy_6m_acumulado, dy_12m_acumulado, dy_3m_media, dy_6m_media, dy_12m_media, dy_ano, variacao_preco, rentabilidade_periodo, rentabilidade_acumulada, pat_liquido, vpa, p_s_vpa, dy_patrimonial, variacao_patrimonial, rentab_pat_periodo, rentab_pat_acumulada, vacancia_fisica, vacancia_financeira, quantidade_ativos)
    @codigo_fundo = codigo_fundo
    @setor = setor
    @preco_atual = preco_atual
    @liquidez_diaria = liquidez_diaria
    @dividendo = dividendo
    @dividend_yield = dividend_yield
    @dy_3m_acumulado = dy_3m_acumulado
    @dy_6m_acumulado = dy_6m_acumulado
    @dy_12m_acumulado = dy_12m_acumulado
    @dy_3m_media = dy_3m_media
    @dy_6m_media = dy_6m_media
    @dy_12m_media = dy_12m_media
    @dy_ano = dy_ano
    @variacao_preco = variacao_preco
    @rentabilidade_periodo = rentabilidade_periodo
    @rentabilidade_acumulada = rentabilidade_acumulada
    @pat_liquido = pat_liquido
    @vpa = vpa
    @p_s_vpa = p_s_vpa
    @dy_patrimonial = dy_patrimonial
    @variacao_patrimonial = variacao_patrimonial
    @rentab_pat_periodo = rentab_pat_periodo
    @rentab_pat_acumulada = rentab_pat_acumulada
    @vacancia_fisica = vacancia_fisica
    @vacancia_financeira = vacancia_financeira
    @quantidade_ativos = quantidade_ativos
  end

  def self.remover_acentos(texto)
    return texto if texto.nil?
    texto = texto.gsub(/(á|à|ã|â|ä)/, 'a').gsub(/(é|è|ê|ë)/, 'e').gsub(/(í|ì|î|ï)/, 'i').gsub(/(ó|ò|õ|ô|ö)/, 'o').gsub(/(ú|ù|û|ü)/, 'u')
    texto = texto.gsub(/(Á|À|Ã|Â|Ä)/, 'A').gsub(/(É|È|Ê|Ë)/, 'E').gsub(/(Í|Ì|Î|Ï)/, 'I').gsub(/(Ó|Ò|Õ|Ô|Ö)/, 'O').gsub(/(Ú|Ù|Û|Ü)/, 'U')
    texto = texto.gsub(/ñ/, 'n').gsub(/Ñ/, 'N')
    texto = texto.gsub(/ç/, 'c').gsub(/Ç/, 'C')
    texto
  end
end