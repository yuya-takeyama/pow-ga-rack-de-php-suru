require 'rubygems'
require 'bundler'
Bundler.require

DOCUMENT_ROOT = File.expand_path('../htdocs', __FILE__)
INDEXES = ['index.html','index.php']

use Rack::Rewrite do
  rewrite %r{^/(.*)}, '/index.php/$1', :if => lambda {|env|
    not File.exists?(File.join(DOCUMENT_ROOT, env['PATH_INFO']))
  }

  rewrite %r{(.*/$)}, lambda {|match, rack_env|
    INDEXES.each do |index|
      if File.exists?(File.join(DOCUMENT_ROOT, rack_env['PATH_INFO'], index))
        return rack_env['PATH_INFO'] + index
      end
    end
    rack_env['PATH_INFO']
  }
end

use Rack::Legacy::Php, DOCUMENT_ROOT
run Rack::File.new DOCUMENT_ROOT
