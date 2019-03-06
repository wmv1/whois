require "whois"
class Domain 
attr_accessor :domain_name, :domain_status, :expires_on, :name_servers
# def initialize(domain)
#   d = whois domain
#   @domain_name = d.domain
#   @domain_status = d.status
#   @expires_on = d.expires_on
#   names = []
#   d.nameservers.length.times do |i|
#   names.push d.nameservers[i].name
#   end
#   @name_servers = names.to_s

# end

 def initialize(domain)
   d = whois domain
   begin
   @domain_name = d.domain
   @domain_status = d.status
   @expires_on = d.expires_on
   names = []
   d.nameservers.length.times do |i|
   names.push d.nameservers[i].name
   end
   @name_servers = names.to_s
   rescue
   @domain_name = d['domain']
   @domain_status = d['status']
   @expires_on = d['expires'].gsub(/(\d{4})(\d{2})(\d{2})/, '\1-\2-\3')
   @name_servers = d['nserver']
   @document = d['ownerid']
   end

 end


private
 def whois dom
	if check_if_br? dom
	 	dominio = whois_br dom
	 	d = convert dominio
	else
	  # client = Whois::Client.new
	  # r = client.lookup(dom)

	   r = Whois.whois(dom)
	   p = r.parser
	   host = r.parts.first
	   host.host
	   p
	end
 end




end
def check_if_br? domain
	domain.end_with? ".br"
end


def whois_br domain
r = Whois.whois domain
a = r.to_s
a = a.split("\n%")
a =  a[7].split("\n")
end


def convert whois
hash = {}
whois.length.times do |i|  
begin
a = whois[i].split(":")
end
begin 
pp a[1]
hash[a[0]] = a[1].to_s.strip
end
#hash[a[0]] = a[1].strip
end
return hash
end


