require 'watir'

@browser = Watir::Browser.new
@browser.goto 'https://www.orbitz.com'

@browser.links(class: 'uitk-tab-anchor')[1].click
@browser.link(text: 'One-way').click

def select_dep_airport city_name, airport_name
  @browser.button(class: 'uitk-faux-input', index: 0).click
  @browser.text_field(class: 'uitk-field-input uitk-typeahead-input  ').set city_name
  choose_airport_by_code airport_name
end

def select_arr_airport city_name, airport_name
  @browser.button(class: 'uitk-faux-input', index: 0).click
  @browser.text_field(class: 'uitk-field-input uitk-typeahead-input  ').set city_name
  choose_airport_by_code airport_name
end

def choose_airport_by_code airport_name
  found = false
  @browser.ul(class: 'uitk-typeahead-results no-bullet').lis.each do |each_result|
    #p each_result.text
    if each_result.text.include? airport_name
      each_result.click
      found = true
      break
    end
  end
  fail "#{dep_airport} is NOT found in the list" if found == false
end

select_dep_airport "Columbus", "(CMH"
select_arr_airport "Cleveland", "(CLE"

# @browser.button(class: 'uitk-faux-input', index: 0).click
# @browser.text_field(class: 'uitk-field-input uitk-typeahead-input  ').set "Columbus"
# sleep 2
# #@browser.lis(class: 'uitk-typeahead-result-item has-subtext').map(&:text)
# #@browser.ul(class: 'uitk-typeahead-results no-bullet').lis.map(&:text)
# dep_airport = "CMH "
# found = false
# @browser.ul(class: 'uitk-typeahead-results no-bullet').lis.each do |each_result|
#   p each_result.text
#   if each_result.text.include? dep_airport
#     each_result.click
#     found = true
#     break
#   end
# end
# fail "#{dep_airport} is NOT found in the list" if found == false

#@browser.ul(class: 'uitk-typeahead-results no-bullet').lis[0].click

p 'done'