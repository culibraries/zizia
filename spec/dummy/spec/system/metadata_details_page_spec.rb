# frozen_string_literal: true
require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'Viewing the field guide' do
  it 'renders correctly' do
    visit('/importer_documentation/guide')
    expect(page).to have_content('title')
    expect(page).to have_content('The name of the resource being described. The title may either be transcribed from the resource itself, or it may need to be created.')
    expect(page).not_to have_content('-- system field - not directly editable --')
  end
  it 'labels system fields and they are not visible' do
    visit('/importer_documentation/guide')
    expect(page.first('div.system-field', visible: false).class).to eq Capybara::Node::Element
  end
  it 'displays the configured delimiter' do
    visit('/importer_documentation/guide')
    expect(page).to have_content('|~|')
  end
end
