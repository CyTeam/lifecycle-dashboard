require 'spec_helper'

describe HostsHelper do

  describe '#check_ssh_state' do
    it 'should return good' do
      Net::SSH.stub(:start)
      check_ssh_state('bookyt.ch').should == 'good'
    end

    it 'should return bad' do
      Net::SSH.stub(:start).and_raise("Errno::ENOENT: No such file or directory - getaddrinfo")
      check_ssh_state('bookyt.ch').should == 'bad'
    end
  end
end
