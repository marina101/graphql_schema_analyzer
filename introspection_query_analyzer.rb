# require Graphql client  https://github.com/github/graphql-client
# require './fixtures/fixture.json'
require 'json'
require 'byebug'

class IntrospectionQueryAnalyzer
  def initialize()
    authenticate
    @schema = read_schema
  end

  attr_reader :schema

  def read_schema
    file = File.open "fixtures/fixture.json"
    data = JSON.load file
    byebug
    data_h["data"]["__schema"]
  end

  private

  def authenticate
  end
end

class Schema
  def initialize(json)
    mutations = mutations
    #...
  end
end

class Analyzer
  def intitialize(schema)
    @schema = schema
  end

  def count(type: "")
    schema[type]["fields"].count
  end

  def mutations
    return @mutations if defined? @mutations

    schema["mutationType"]["fields"]
  end
end

introspection_query_analyer = IntrospectionQueryAnalyzer.new 
puts introspection_query_analyer.schema

# {
#   __type(name:"ApiVersion") {
#     name
#     description
#   }
#   __schema {
#     mutationType {
#       name
#       description
#       inputFields {
#         name
#       }
#     }
    
#     types {
#       name
#       kind
#       name
#       description
#       fields {
#         name
#         description
#         args {
#           description
#           defaultValue
#         }
#         type {
#           name
#           description
#         }
#         isDeprecated
#       }
#     }
#   }
# }


# Interesting metrics: 


# Number of Mutations
  # Number of Deprecated objects 
# Number of Query
  # Number of Deprecated objects 
# Number of subscription 
# Number of directives


# Impactful goal: 
  # 1) Read the schema and notify on a github issue all the derprecated fields we have. 
  # 2) Who use that fields? 