module HostsHelper
  def check_ssh_state(host)
    begin
      Net::SSH.start(host,'rails') do |ssh|
      end
      'good'
    rescue
      'bad'
    end
  end
end
