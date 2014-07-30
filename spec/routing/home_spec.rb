require 'rails_helper'

describe 'routes to the public pages' do
  it 'routes / to public_controller#home' do
    expect(get: '/').to route_to(
                            controller: 'public',
                            action: 'home'
                        )
  end

  it 'routes /about to public_controller#about' do
    expect(get: '/about').to route_to(
                            controller: 'public',
                            action: 'about'
                        )
  end

  it 'routes /terms to public_controller#terms' do
    expect(get: '/terms').to route_to(
                            controller: 'public',
                            action: 'terms'
                        )
  end

  it 'routes /privacy to public_controller#privacy' do
    expect(get: '/privacy').to route_to(
                            controller: 'public',
                            action: 'privacy'
                        )
  end

  it 'routes /contact to public_controller#contact' do
    expect(get: '/contact').to route_to(
                            controller: 'public',
                            action: 'contact'
                        )
  end
end