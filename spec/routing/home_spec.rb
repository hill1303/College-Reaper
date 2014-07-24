require 'rails_helper'

describe "routes to the public pages"  do
  it "routes / to public_controller#home" do
	expect(get: '/').to route_to(
	  controller: 'public',
      action: 'home'
		)
  end
end