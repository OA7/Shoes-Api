require 'rails_helper'

RSpec.describe AuthController, type: :controller do
  it { should route(:post, '/login').to(action: :login) }
end
