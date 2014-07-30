require 'rails_helper'

describe CompleteController  do
  include Devise::TestHelpers

  describe '#index' do
    it 'renders the index template' do
        get :completions
        expect(response).to render_template('index')
    end
  end
  describe '#new' do
  it 'renders the home template' do
        get :completions
        expect(response).to render_template('new')
    end
  end
  describe '#show' do
  it 'renders the home template' do
        get :completions
        expect(response).to render_template('show')
    end
  end
  describe '#edit' do
  it 'renders the home template' do
        get :completions
        expect(response).to render_template('edit')
    end
  end
  describe '#create' do
  it 'renders the home template' do
        get :completions
        expect(response).to render_template('create')
    end
  end
end