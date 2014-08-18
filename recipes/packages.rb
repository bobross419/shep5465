include_recipe 'apt'

packages = %w(
  vim
  screen
  python
  ruby
  ruby-dev
  gcc
  curl
  make
  git
  libxslt-dev
  libxml2-dev
)

packages.each do |pkg|
  package pkg do
    action :install
  end
end
