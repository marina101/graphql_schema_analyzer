require 'byebug'

class TypeNotFound < StandardError
end

class SchemaAnalyzer
  def initialize(schema)
    @schema = schema
    analyze
  end

  attr_reader :analysis, :schema

  def analyze
    count_of_mutations_types       = count(type: "mutation")
    count_of_queries_types         = count(type: "query")
    count_of_subscriptions_types   = count(type: "subscription")

    @analysis = {
      mutations: count_of_mutations_types,
      queries: count_of_queries_types,
      subscriptions: count_of_subscriptions_types
    }
  end

  def print_analysis
    puts analysis
  end

  private

  def count(type: "")
    case type
    when "mutation"
      @schema.mutation ? @schema.mutation.own_fields.length : 0
    when "query"
      @schema.query ? @schema.query.own_fields.length : 0
    when "subscription"
      @schema.subscription ? @schema.subscription.own_fields.length : 0
    else
      raise TypeNotFound
    end
  end
end