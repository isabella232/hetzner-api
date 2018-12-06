module Hetzner
  class API
    module Boot
      module Rescue
        # enables the rescue systm for given IP address/server using <em>os</em> (operating system) and <em>arch</em> (architecture)
        #
        # see <em>boot?</em> method to query the API for available options
        #
        # defaults to 64bit Linux
        def enable_rescue!(ip, os = 'linux', arch = '64', sshkey=nil)
          query = { :os => os, :arch => arch }
          query['ssh_keys'] = [ sshkey ] if sshkey
          perform_post "/boot/#{ip}/rescue", :query => query
        end
        
        # disables the rescue system for a given IP address/server
        def disable_rescue!(ip)
          perform_delete "/boot/#{ip}/rescue"
        end
      end
    end
  end
end