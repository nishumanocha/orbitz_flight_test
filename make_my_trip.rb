require 'watir'


@browser = Watir::Browser.new
@browser.goto 'https://www.makemytrip.com/?ccde=us'
@browser.div(class: 'fsw_inputBox searchCity inactiveWidget ').set


def leaving_from
  # @browser.button(class: 'uitk-faux-input')[1].click.lis.each do |aiport_name|
  #   @browser.button(text: 'Leaving from').click.lis.each do |aiport_name|
  #     p each_airport.text
  #     if each_airport.text.upcase.include? airport_name
  #       each_airport.click
  #       break
  #     end
  #   end
  # end
  # end
  #