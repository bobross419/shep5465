gems = %w(
  fog
)

gems.each do |gem|
  gem_package gem do
    action :install
  end
end
