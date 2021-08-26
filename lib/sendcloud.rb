require "faraday"
require "faraday_middleware"
require "sendcloud/version"

module Sendcloud
  autoload :Client, "sendcloud/client"
  autoload :Error, "sendcloud/error"
  autoload :Object, "sendcloud/object"
  autoload :Resource, "sendcloud/resource"

  autoload :ParcelResource, "sendcloud/resources/parcel"
  autoload :Parcel, "sendcloud/objects/parcel"
end
