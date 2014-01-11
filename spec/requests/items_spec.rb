require 'spec_helper'

describe 'Items' do
  let!(:user) { FactoryGirl.create(:user) }

  before { sign_in(user) }

  describe 'Create' do
    let(:item) { FactoryGirl.build(:item) }

  	it 'should create new item' do
  	  visit items_path

  	  click_link I18n.t('authenticated.items.add_item')
  	  fill_in 'item_name', with: item.name
  	  fill_in 'item_url', with: item.url
  	  click_button I18n.t('common.submit')

  	  page.should have_content item.name
  	end
  end

  describe 'Update' do
    let(:new_item_name) { 'New item name' }

    it 'should update item' do
      item = FactoryGirl.create(:item, user: user)
      visit items_path

      click_link "edit-item-name-#{item.id}"
      fill_in 'item_name', with: new_item_name
      click_link I18n.t('authenticated.items.item.edit')

      page.should have_content(new_item_name)
    end
  end

  describe 'Destroy' do
    it 'should destroy item' do
      item = FactoryGirl.create(:item, user: user)

      visit items_path
      click_link I18n.t('authenticated.items.item.destroy')
      page.driver.browser.switch_to.alert.accept
      page.should_not have_content(item.name)
    end
  end

end