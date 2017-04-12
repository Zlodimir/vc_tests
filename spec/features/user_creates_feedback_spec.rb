require 'rails_helper'

feature 'User creates a feedback' do
  scenario 'can click on feedback link, fill and submit' do
    visit '/'
    expect(page).to have_link('Feedback')
    click_link 'Feedback'
    expect(page).to have_content('Feedback page of the site')
    # check that success alert div is invisible
    expect(page).to have_selector('.alert-success', visible: false)

    fill_in 'email', with: 'test@test.test'
    fill_in 'text', with: 'Text'
    first('button').click
    # check that success alert div is visible now
    expect(page).to have_selector('.alert-success', visible: true)
    expect(find_field('email').value).to be_empty
    expect(find_field('text').value).to be_empty
  end
end
