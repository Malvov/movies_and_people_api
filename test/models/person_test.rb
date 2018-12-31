require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @person = Person.new(first_name: 'Manuel', last_name: 'Olivares')
  end

  test 'person info should be present' do
    @person.first_name = ''
    @person.last_name = ''
    assert_not @person.valid?
  end

  test 'should reject people with same first name and last name' do
    @person.save
    @second_person = Person.new(first_name: 'Manuel', last_name: 'Olivares')
    @third_person = Person.new(first_name: 'mAnuEl', last_name: 'oLivares')
    assert_not @second_person.valid? && @third_person.valid?
  end
end
