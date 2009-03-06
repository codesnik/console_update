require File.join(File.dirname(__FILE__), 'test_helper')
require 'console_update/filter/ya2yaml'
$KCODE = 'UTF8'

class ConsoleUpdate::Ya2YamlTest < Test::Unit::TestCase
  test 'should load ya2yaml filter' do
    assert_nothing_raised do
      ConsoleUpdate::Filter.new(:ya2yaml)
    end
  end

  test 'should work with unicode' do
    string = 'что-то по-русски'
    filter = ConsoleUpdate::Filter.new(:ya2yaml)
    assert_equal string, filter.string_to_hashes( filter.hashes_to_string(string) )
  end

  test 'should dump unicode as something readable' do
    string = 'что-то по-русски'
    filter = ConsoleUpdate::Filter.new(:ya2yaml)
    assert_equal filter.hashes_to_string(string), "--- \"что-то по-русски\"\n"
  end
end
