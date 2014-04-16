require 'spec_helper'

describe 'Items' do
  let!(:user) { FactoryGirl.create(:user) }

  before { sign_in(user) }

  describe 'Create' do
    let(:item) { FactoryGirl.build(:item) }

  	it 'creates new item' do
  	  visit items_path

  	  click_link I18n.t('authenticated.items.add_item')
  	  fill_in 'item_name', with: item.name
  	  fill_in 'item_URL', with: item.URL
  	  click_button I18n.t('common.submit')

  	  expect(page).to have_content item.name
  	end
  end

  describe 'Update' do
    let(:new_item_name) { 'New item name' }

    it 'updates item' do
      item = FactoryGirl.create(:item, user: user)
      visit items_path

      click_link "edit-item-#{item.id}"
      fill_in 'item_name', with: new_item_name
      click_button I18n.t('authenticated.items.item.edit')

      expect(page).to have_content(new_item_name)
    end
  end

  describe 'Destroy' do
    it 'destroys item' do
      item = FactoryGirl.create(:item, user: user)

      visit items_path
      click_link "destroy-item-#{item.id}"
      expect(page).to_not have_content(item.name)
    end
  end

end
