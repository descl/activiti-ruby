require 'rest_client'
require 'uri'
require "active_support/core_ext"

module ActivitiRuby
  class Activiti
    
    def initialize(endpoint)
      @uri = endpoint+"/activiti-rest/service/"
    end
    def listProcess
      RestClient.get @uri+'process-definitions'
    end
    
    def listProcessInstances(processKey)
      RestClient.get @uri+'process-instances'
    end
    def listGroupUsers(group)
      RestClient.get @uri+'groups/'+group+'/users'
    end
    
    def listJobs
      RestClient.get @uri+'management/jobs'
    end
    
    def instanciateProcess (processKey,user,group)
      RestClient.post @uri+'process-instance',  {'processDefinitionKey' => processKey, 'owner' => user}.to_json
    end
    
    def instanceInformations(instanceId)
      RestClient.get @uri+'processInstance/'+instanceId
    end
    
    def taskInformations(taskId)
      RestClient.get @uri+'task/'+taskId
    end
    
    def performTask(taskId,state, params,group)
      RestClient.put @uri+'task/'+taskId+'/'+state,  params.to_json
    end
    
    def login(userId,password)
      RestClient.post @uri+'login',  {'userId' => userId, 'password' => password}.to_json, :content_type => 'application/json'
    end
    
    def getForm(taskId)
      RestClient.get @uri+'form/'+taskId+'/properties'
    end
    
    def getDiagram(instanceId)
      RestClient.get @uri+'processInstance/'+instanceId+'/diagram'
    end
    
  end
end
