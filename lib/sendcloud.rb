require "faraday"
require "faraday_middleware"
require "sendcloud/version"

module Sendcloud
  autoload :Client, "sendcloud/client"
  autoload :ServicePointClient, "sendcloud/service_point_client"
  autoload :Error, "sendcloud/error"
  autoload :Object, "sendcloud/object"
  autoload :Resource, "sendcloud/resource"
  autoload :Collection, "sendcloud/collection"

  autoload :ParcelResource, "sendcloud/resources/parcel"
  autoload :ParcelStatusResource, "sendcloud/resources/parcel_status"
  autoload :ShippingMethodResource, "sendcloud/resources/shipping_method"
  autoload :LabelResource, "sendcloud/resources/label"
  autoload :ServicePointResource, "sendcloud/resources/service_point"

  autoload :Parcel, "sendcloud/objects/parcel"
  autoload :ParcelStatus, "sendcloud/objects/parcel_status"
  autoload :ShippingMethod, "sendcloud/objects/shipping_method"
  autoload :Label, "sendcloud/objects/label"
  autoload :ServicePoint, "sendcloud/objects/service_point"
end
