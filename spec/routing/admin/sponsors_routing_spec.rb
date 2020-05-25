# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SponsorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/sponsors').to route_to('admin/sponsors#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/sponsors/new').to route_to('admin/sponsors#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/sponsors/1').to route_to(
        'admin/sponsors#show',
        id: '1'
      )
    end

    it 'routes to #edit' do
      expect(get: '/admin/sponsors/1/edit').to route_to(
        'admin/sponsors#edit',
        id: '1'
      )
    end

    it 'routes to #create' do
      expect(post: '/admin/sponsors').to route_to('admin/sponsors#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/sponsors/1').to route_to(
        'admin/sponsors#update',
        id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/sponsors/1').to route_to(
        'admin/sponsors#update',
        id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/sponsors/1').to route_to(
        'admin/sponsors#destroy',
        id: '1'
      )
    end
  end
end
