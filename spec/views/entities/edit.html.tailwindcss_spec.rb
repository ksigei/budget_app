require 'rails_helper'

RSpec.describe 'entities/edit', type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
                                name: 'MyString',
                                amount: 1,
                                user: nil,
                                group: nil
                              ))
  end

  it 'renders the edit entity form' do
    render

    assert_select 'form[action=?][method=?]', entity_path(@entity), 'post' do
      assert_select 'input[name=?]', 'entity[name]'

      assert_select 'input[name=?]', 'entity[amount]'

      assert_select 'input[name=?]', 'entity[user_id]'

      assert_select 'input[name=?]', 'entity[group_id]'
    end
  end
end
