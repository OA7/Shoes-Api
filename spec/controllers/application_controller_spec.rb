require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  it { should use_before_action(:authorized) }
end
