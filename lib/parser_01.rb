require 'nokogiri'
require 'open-uri'

#------------------------------------------------------------------------------------------------------------------------#
#OPEN THE DESIRED URL & BROWSE THE DATA VIA XPATH 
#------------------------------------------------------------------------------------------------------------------------#


def get_email(nom)
  nom_commune = nom['href'].delete_prefix '.'
  em = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{nom_commune}"))
  em.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def mairie_christmas
  pages = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  tab = pages.css('[@class="lientxt"]')
  tab.map { |nom| { nom.text => get_email(nom) } }
end

begin
  pp mairie_christmas
rescue StandardError => e
  puts e.message
else
  puts 'Well Done!'
end


#------------------------------------------------------------------------------------------------------------------------#
#END
#------------------------------------------------------------------------------------------------------------------------#
