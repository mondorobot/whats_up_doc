require 'spec_helper'

describe WhatsUpDoc::Middleware do
  it 'should have a version number' do
    WhatsUpDoc::VERSION.should_not be_nil
  end


  let(:app){->(env) { [200, env, "app"]}}
  let(:middleware){WhatsUpDoc::Middleware.new(app, path: '/up')}

  context 'when GET /up is called' do
    let(:env){Rack::MockRequest.env_for('https://www.example.com/up', {})}

    it 'responds to up with 200' do
      code, _ = middleware.call(env)

      expect(code).to eq(200)
    end
  end

  context 'when another path is called' do
    let(:env){Rack::MockRequest.env_for('https://www.example.com/somewhere-else', {})}

    it 'delegates to the next app in the chain' do
      expect(app).to receive(:call).with(env)

      middleware.call(env)
    end
  end
end
