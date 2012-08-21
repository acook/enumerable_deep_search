require_relative 'spec_helper'
require 'enumerable_deep_search'

describe EnumerableDeepSearch do
  let(:eds){Object.new.extend EnumerableDeepSearch}

  it 'should exist' do
    subject.should be
  end

  it 'should define methods on objects it extends' do
    class DummyClass; end
    dummy = DummyClass.new
    dummy.extend EnumerableDeepSearch
    dummy.should respond_to(:search)
  end

  describe '#research' do
    it 'should match identical objects' do
      object = Object.new
      result = eds.research object, object
      result.should == object
    end

    it 'should match keys in a hash' do
      hash = {foo: 'bar'}
      result = eds.research hash, :foo
      result.should == hash
    end

    it 'should match values in a hash' do
      hash = {foo: 'bar'}
      result = eds.research hash, 'bar'
      result.should == hash
    end

    it 'should match values in an array' do
      array = [:foo]
      result = eds.research array, :foo
      result.should == [0, :foo]
    end
  end
end
