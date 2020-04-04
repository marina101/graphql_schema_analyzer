class TypeNotFound < StandardError
end

class SchemaAnalyzer
  def initialize(schema)
    @schema = schema
    analyze
  end

  attr_reader :count_of_mutations_types, :count_of_queries_types, :count_of_subscriptions_types, :analysis

  def analyze
    @count_of_mutations_types       = count(type: "mutation")
    @count_of_queries_types         = count(type: "query")
    @count_of_subscriptions_types   = count(type: "subscription")

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
      # TODO
      0
    when "query"
      # TODO
      0
    when "subscription"
      # TODO
      0
    else
      raise TypeNotFound
    end
  end
end