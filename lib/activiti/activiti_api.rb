require 'rest_client'
require "active_support/core_ext"

module ActivitiRuby
  class Activiti
    
    def initialize(endpoint)
      @uri = URI.parse endpoint
    end
    def url(user='ADMIN')
      return @uri+"/activiti-rest/service/"
    end
    def listProcess
      RestClient.get url+'process-definitions'
    end
    
    def listProcessInstances(processKey)
      RestClient.get url+'process-instances'
    end
    def listGroupUsers(group)
      RestClient.get url+'groups/'+group+'/users'
    end
    
    def listJobs
      RestClient.get url+'management/jobs'
    end
    
    def instanciateProcess (processKey,user,group)
      RestClient.post url(group)+'process-instance',  {'processDefinitionKey' => processKey, 'owner' => user}.to_json
    end
    
    def instanceInformations(instanceId)
      RestClient.get url+'processInstance/'+instanceId
    end
    
    def taskInformations(taskId)
      RestClient.get url+'task/'+taskId
    end
    
    def performTask(taskId,state, params,group)
      RestClient.put url(group)+'task/'+taskId+'/'+state,  params.to_json
    end
    
    def login(userId,password)
      RestClient.post url+'login',  {'userId' => userId, 'password' => password}.to_json, :content_type => 'application/json'
    end
    
    def getForm(taskId)
      RestClient.get url+'form/'+taskId+'/properties'
    end
    
    def getDiagram(instanceId)
      RestClient.get url+'processInstance/'+instanceId+'/diagram'
    end
    
  end
end
