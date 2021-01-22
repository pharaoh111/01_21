require 'nokogiri'
require 'open-uri'



#------------------------------------------------------------------------------------------------------------------------#
#OPEN THE DESIRED URL 
#------------------------------------------------------------------------------------------------------------------------#
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))


array1 = []
array2 = []



#------------------------------------------------------------------------------------------------------------------------#
#BROWSE THE DATA VIA XPATH 
#------------------------------------------------------------------------------------------------------------------------#

doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]').each do |link|
    array1 << link.content
    #return link
end

doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]').each do |item|
    array2 << item.content
    #return item
end



#------------------------------------------------------------------------------------------------------------------------#
#PUTS THE CONVERT ARRAY ===> HASH
#------------------------------------------------------------------------------------------------------------------------#
widgets = Hash[array1.zip(array2)]

puts widgets

#puts finalarray = Hash[array1.zip(array2.map {|i| i.split /, /})]

 #END.