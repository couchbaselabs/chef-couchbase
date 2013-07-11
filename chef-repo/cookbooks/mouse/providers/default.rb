action :say do
	log "My name is #{new_resource.given_name}"
	unless new_resource.phrase =~ /^squeak$/
		log "#{new_resource.phrase}"
	end
	log "I #{new_resource.tail ? 'do' : 'do not' } have a tail"
end
