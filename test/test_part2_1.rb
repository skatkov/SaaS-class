#!/usr/bin/env ruby -wKU
require 'test/unit'
require '../homework2/part1'

class TestMetaprogramming < Test::Unit::TestCase

  def test_string_palindromes
    palindromes = ["Satan Oscillate My Metallic Sonatas", "Ekalaka Lake",
                   "Adaven, Nevada!", "21/02/2012", "If I Had a Hi-Fi",
                   "A man, a plan, a canal -- Panama", "Madam, I'm Adam!",
                   "Anita lava la tina", "Era poeta e di nome Semonide. Ateo pare.",
                   "^Madam, I'm Adam!$", ""]
    not_palindromes = ["Abracadabra"]

    palindromes.each { |pal| assert pal.palindrome? }
    not_palindromes.each { |not_pal| assert !not_pal.palindrome? }
  end

  def test_enumerable_palindromes
    palindromes = [
      [1,2,3,2,1], [1,1], [:one, :two, :two, :one]
    ]
    not_palindromes = [
      [1,2,3,1,2], [:one, :two]
    ]

    palindromes.each { |pal| assert pal.palindrome? }
    not_palindromes.each { |not_pal| assert !not_pal.palindrome? }
  end

  def test_hash_palindromes
    assert_nothing_raised do
      { :one => 1, :two => 2, :one => 1 }.palindrome?
    end
  end

  def test_non_array_non_hash_enumerable
    assert !(1..5).palindrome?
    r = Range.new(1, 2, true)
    assert r.palindrome?
  end

  def test_foo_palindrome
    assert Foo.new(1,9).palindrome?
  end



end

class Foo
  def initialize(first, second)
    @a = first
    @b = second
  end
end
