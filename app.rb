# Importing libraries and classes
require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative 'fund'

# General information
csv_file_path = File.join(__dir__, 'funds.csv')
url = 'https://www.fundsexplorer.com.br/ranking'
doc = Nokogiri::HTML(open(url), nil, 'utf-8')

# Function to strip and clean text
def strip_text(html_doc)
  html_doc_array = []
  html_doc.each do |title|
    html_doc_array << Fund.remover_acentos(title.text.strip)
  end
  return html_doc_array
end

# Getting header names
headers = strip_text(doc.css('thead tr th'))
fund_index = 0

# Parsing body information
parsed_body = doc.css('tbody tr td')

#  Calculating lenght of the body for while loop
body_length = parsed_body.length / headers.length

# Parsing information and saving it to CSV
CSV.open(csv_file_path, 'w') do |csv|
  csv << headers
  while fund_index < body_length do
    parsed = doc.css('tbody tr')[fund_index].css('td')
    fundo = Fund.new(parsed[0].text.strip, parsed[1].text.strip, parsed[2].text.strip, parsed[3].text.strip, parsed[4].text.strip, parsed[5].text.strip, parsed[6].text.strip, parsed[7].text.strip, parsed[8].text.strip, parsed[9].text.strip, parsed[10].text.strip, parsed[11].text.strip, parsed[12].text.strip, parsed[13].text.strip, parsed[14].text.strip, parsed[15].text.strip, parsed[16].text.strip, parsed[17].text.strip, parsed[18].text.strip, parsed[19].text.strip, parsed[20].text.strip, parsed[21].text.strip, parsed[22].text.strip, parsed[23].text.strip, parsed[24].text.strip, parsed[25].text.strip)
    csv << [fundo.codigo_fundo, Fund.remover_acentos(fundo.setor), fundo.preco_atual, fundo.liquidez_diaria, fundo.dividendo, fundo.dividend_yield, fundo.dy_3m_acumulado, fundo.dy_6m_acumulado, fundo.dy_12m_acumulado, fundo.dy_3m_media, fundo.dy_6m_media, fundo.dy_12m_media, fundo.dy_ano, fundo.variacao_preco, fundo.rentabilidade_periodo, fundo.rentabilidade_acumulada, fundo.pat_liquido, fundo.vpa, fundo.p_s_vpa, fundo.dy_patrimonial, fundo.variacao_patrimonial, fundo.rentab_pat_periodo, fundo.rentab_pat_acumulada, fundo.vacancia_fisica, fundo.vacancia_financeira, fundo.quantidade_ativos]
    fund_index += 1
  end
end
