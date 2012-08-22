require '../lib/activiti/activiti_api'

instance = ActivitiRuby::Activiti.new 'http://kermit:kermit@localhost:8080'
response = instance.listProcess

puts response