module SerialMagnet
  module Utils
    def perform_get type, path, id=nil, key=path
      response = SerialMagnet::Request.new(self, :get, "#{path}/#{id}").perform
      response[key].each_with_index.map { |object, index| SerialMagnet::Object.new({ type => object.merge(number: index + 1) }) }
    end

    def perform_get_all type, path, key=path
      response = SerialMagnet::Request.new(self, :get, "#{path}").perform
      count = (response["meta"]["total"]/10).ceil
      (1..count).each do |x|
        result = SerialMagnet::Request.new(self, :get, "#{path}?page=#{x+1}").perform
        response[key] = response[key] + result[key]
      end
      response[key].each_with_index.map { |object, index| SerialMagnet::Object.new({ type => object.merge(number: index + 1) }) }
    end
  end
end