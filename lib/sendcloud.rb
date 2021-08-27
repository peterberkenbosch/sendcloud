require "faraday"
require "faraday_middleware"
require "sendcloud/version"

module Sendcloud
  autoload :Client, "sendcloud/client"
  autoload :Error, "sendcloud/error"
  autoload :Object, "sendcloud/object"
  autoload :Resource, "sendcloud/resource"
  autoload :Collection, "sendcloud/collection"

  autoload :ParcelResource, "sendcloud/resources/parcel"
  autoload :ParcelStatusResource, "sendcloud/resources/parcel_status"
  autoload :ShippingMethodResource, "sendcloud/resources/shipping_method"

  autoload :Parcel, "sendcloud/objects/parcel"
  autoload :ParcelStatus, "sendcloud/objects/parcel_status"
  autoload :ShippingMethod, "sendcloud/objects/shipping_method"
end
