require 'spec_helper_acceptance'

describe 'apache class' do

  context 'default parameters' do
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'apache': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe package('httpd'), :if => os[:family] == 'RedHat' do
      it { should be_installed }
    end

    describe service('httpd'), :if => os[:family] == 'RedHat' do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe package('apache2'), :if => os[:family] == 'Ubuntu' do
      it { should be_installed }
    end

    describe service('apache2'), :if => os[:family] == 'Ubuntu' do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe port(80) do
      it { should be_listening }
    end
  end

end

