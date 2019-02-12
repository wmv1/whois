Rails.application.routes.draw do
 root to: "whois#index"
 get 'whois/show' 
end
