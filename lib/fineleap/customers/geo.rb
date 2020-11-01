require 'geokit'

Geokit::default_units = :kms # others :kms, :nms, :meters

module Fineleap
  module Customers
    class Geo
      BERLIN_OFFICE_LAT = 52.508283
      BERLIN_OFFICE_LONG = 13.329657

      # distance_range default is 100 km
      def self.in_range(distance_range = 100)
        berlin_office = Geokit::LatLng.new(BERLIN_OFFICE_LAT, BERLIN_OFFICE_LONG)
        Data.all.select do |customer|
          destination = Geokit::LatLng.new(customer['latitude'], customer['longitude'])
          berlin_office.distance_to(destination) <= distance_range
        end.sort_by { |customer| customer['user_id'] }
      end
    end
  end
end

