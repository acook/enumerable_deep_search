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

  describe '#search' do
    it 'should proxy to research' do
      eds.should_receive(:research)
      eds.search :foo
    end
  end

  describe '#research' do
    context 'simple object matching' do
      it 'should match identical objects' do
        object = Object.new
        result = eds.research object, object
        result.should == object
      end

      it 'should match keys in a hash' do
        hash = {'match' => 'bar'}
        result = eds.research hash, 'match'
        result.should == hash
      end

      it 'should match values in a hash' do
        hash = {foo: 'match'}
        result = eds.research hash, 'match'
        result.should == hash
      end

      it 'should match values in an array' do
        array = ['match']
        result = eds.research array, 'match'
        result.should == [0, 'match']
      end
    end

    context 'nested structures' do
      it 'should match values in nested hashes' do
        hash = {foo: {bar: 'match'}}
        result = eds.research hash, 'match'
        result.should == hash
      end

      it 'should match keys in nested hashes' do
        hash = {foo: {'match' => 1}}
        result = eds.research hash, 'match'
        result.should == hash
      end

      it 'should match elements in nested array' do
        array = [:foo, [:bar, 'match']]
        result = eds.research array, 'match'
        result.should == [1, [1, 'match']]
      end

      it 'should match objects in mixed hashes and arrays' do
        struture = [:foo, {bar: [1,2,3,{baz: 'match'}]}]
        result = eds.research struture, 'match'
        result.should == [1, {:bar=>[3, {:baz=>"match"}]}]
      end
    end

    context 'matching enumerable objects' do
      it 'should match full arrays' do
        array = [1]
        result = eds.research array, array
        result.should == array
      end

      it 'should match full hashes' do
        hash = {a: 1}
        result = eds.research hash, hash
        result.should == hash
      end
    end
  end
end
