# require Graphql client  https://github.com/github/graphql-client
# require './fixtures/fixture.json'
require 'json'
require "graphql"
require_relative 'schema_analyzer'

class IntrospectionQueryAnalyzer
  def initialize(schema_path: "fixtures/fixture.json" )
    authenticate
    @schema = read_schema
  end

  def analyze
    analyzer = SchemaAnalyzer.new(@schema)
    analyzer.print_analysis
  end

  attr_reader :schema

  private

  def read_schema
    schema_str = File.read "fixtures/schema.graphql"
    GraphQL::Schema.from_definition(schema_str)
  end

  def authenticate
    # TODO
  end
end

introspection_query_analyer = IntrospectionQueryAnalyzer.new
introspection_query_analyer.analyze
