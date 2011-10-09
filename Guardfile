guard 'minitest' do
  watch(%r|^lib/less/rails/bootstrap/(.*)\.rb|)   { |m| "test/cases/#{m[1]}_spec.rb" }
  watch(%r|^test/spec_helper\.rb|)                { "test/cases" }
  watch(%r|^test/cases/(.*)_spec\.rb|)
end
