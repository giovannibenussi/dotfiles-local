require 'awesome_print'

crm_user = User.find_by(email: 'giovanni.benussi@usach.cl')&.crm_user

"giovanni.benussi@usach.cl exists?: #{!crm_user.nil?}"

trigger
