require 'rack'

module WhatsUpDoc
  class Middleware
    DEFAULTS = {path: '/up'}

    def initialize(app, options = {})
      @app = app
      @options = DEFAULTS.merge(options)
    end

    def call(env)
      @env = env

      if up_path?
        [200, {}, []]
      else
        app.call(env)
      end
    end

  private
    attr_reader :app, :env, :options

    def request
      Rack::Request.new(env)
    end

    def up_path?
      options[:path] == request.fullpath
    end
  end
end
