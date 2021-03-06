require 'spec_helper'

describe Restforce::Mash do
  describe '#build' do
    subject { described_class.build(input, nil) }

    context 'when array' do
      let(:input) { [{ :foo => 'hello' }, { :bar => 'world' }] }
      it { should be_all { |obj| expect(obj).to be_a Restforce::Mash } }
    end
  end

  describe '#klass' do
    subject { described_class.klass(input) }

    context 'when the hash has a "records" key' do
      let(:input) { { 'records' => nil } }
      it { should eq Restforce::Collection }
    end

    context 'when the hash has an "attributes" key' do
      let(:input) { { 'attributes' => nil } }
      it { should eq Restforce::SObject }
    end

    context 'else' do
      let(:input) { {} }
      it { should eq Restforce::Mash }
    end
  end
end
