module Siilar
  class Client
    module Tracks

      # Creates a track.
      #
      # @see http://api.siilar.com/1.0/doc/tracks#create-a-track
      def create(attributes = {})
        Extra.validate_mandatory_attributes(attributes, [:title, :external_id])
        response = client.post('v1/tracks', attributes)

        Struct::Track.new(response)
      end

      # Gets a track.
      #
      # @see http://api.siilar.com/1.0/doc/tracks#get-a-track
      def track(track)
        response = client.get("v1/tracks/#{track}")

        Struct::track.new(response)
      end

      # Updates a track.
      #
      # @see http://api.siilar.com/1.0/doc/tracks#edit-a-track
      def update(track, attributes = {})
        response = client.patch("v1/tracks/#{track}", attributes)

        Struct::Track.new(response)
      end

      # Deletes a track.
      #
      # @see http://api.siilar.com/1.0/doc/tracks#delete-a-track
      def delete(track)
        client.delete("v1/tracks/#{track}")
      end
    end
  end
end
