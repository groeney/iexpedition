module FormSteps
  step 'I fill form fields with:' do |data|
    data.each do |input, value|
      begin
        fill_in input, with: value
      rescue Capybara::ElementNotFound
        find(input).set(value)
      end
    end
  end

  step 'I hit Enter on :selector' do |selector|
    find(selector).send_keys(:enter)
  end

  step 'I select :option' do |option|
    find(:xpath, "//option[normalize-space(text()) = '#{option}']").select_option
  end

  step 'I select :date date' do |date|
    page.execute_script("$('.datepicker').datepicker('setDate', '#{date}')")
  end
end
RSpec.configure { |c| c.include FormSteps }