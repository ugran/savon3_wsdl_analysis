class PagesController < ApplicationController
require 'savon'

	def home
    client = Savon.new('http://book.api.mouzenidis.com/ws-package/test/ReservationFacade.svc?wsdl')
		#@show = client.services
    @show = client.operations('ReservationFacade', 'BasicHttpBinding_IReservationFacade')
  	#@show = client.operation('ReservationFacade', 'BasicHttpBinding_ISecurityFacade', 'CreateSecurityToken').example_body
	end

	private

		def call_pegast_static(method, message)
			client = Savon.client(wsdl: "https://api-ext-test.pegasys.pegast.com/StaticReferenceData.svc?singleWsdl",
									 log: true,
									 convert_request_keys_to: :none)
		 return client.call(method,message)
		end

end
