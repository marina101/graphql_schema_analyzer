# require Graphql client  https://github.com/github/graphql-client
# require './fixtures/fixture.json'
require 'json'
require "graphql"
require_relative 'schema_analyzer'

class IntrospectionQueryAnalyzer
  def initialize(schema_path: "fixtures/schema.graphql" )
    authenticate
    @schema = read_schema(schema_path)
  end

  def analyze
    analyzer = SchemaAnalyzer.new(@schema)
    analyzer.print_analysis
  end

  attr_reader :schema

  private

  def read_schema(schema_path)
    schema_str = File.read schema_path
    GraphQL::Schema.from_definition(schema_str)
  end

  def authenticate
    # TODO
  end
end

introspection_query_analyer = IntrospectionQueryAnalyzer.new
introspection_query_analyer.analyze
