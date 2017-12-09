require "rest-client"
i=0
EARTHQUAKE_FEED_URL ="https://haha-4cf04.firebaseio.com/.json"

# eq_json_data = RestClient.get EARTHQUAKE_FEED_URL
# raw_data = JSON.parse(eq_json_data)
# real_data = []
# raw_data['todos1'].each do |f|
#    lat = f['light']
#    real_data << [lat]
# end





source = 'http://some.remote.host/barchart.xml'

labels = ['Time']
SCHEDULER.every '10s', :first_in => 0 do |job|
  eq_json_data = RestClient.get EARTHQUAKE_FEED_URL
  raw_data = JSON.parse(eq_json_data)
  real_data = []
  raw_data['todos1'].each do |f|
    lat = f['light']
    real_data << [lat]
  end
  data = [
    {
      label: 'First dataset',
      data: Array.new(labels.length) { real_data[i] },
      backgroundColor: [ 'rgba(255, 99, 132, 0.2)' ] * labels.length,
      borderColor: [ 'rgba(255, 99, 132, 1)' ] * labels.length,
      borderWidth: 1,
    }
  ]
  print real_data[i]
  send_event('barchart', { labels: labels, datasets: data })
  i=i+1
end
