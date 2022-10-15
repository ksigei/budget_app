require 'rails_helper'

RSpec.describe 'entities/index', type: :view do
  before(:each) do
    assign(:entities, [
             Entity.create!(
               name: 'Name',
               amount: 2,
               user: nil,
               group: nil
             ),
             Entity.create!(
               name: 'Name',
               amount: 2,
               user: nil,
               group: nil
             )
           ])
  end

  it 'renders a list of entities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
