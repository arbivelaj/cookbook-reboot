# initialize a class called cookbook with a csv file path
require "csv"
require_relative "recipe.rb"

class Cookbook
  def initialize(csv_file)
    @csv = csv_file
    @recipes = []
    load_csv if File.exist?(@csv)
  end

  def all
    @recipes
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def create(new_recipe)
    @recipes << new_recipe
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv, "wb") do |csv_line|
      @recipes.each do |recipe|
        csv_line << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv) do |csv_line|
      new_recipe = Recipe.new(csv_line[0], csv_line[1])
      @recipes << new_recipe
    end
  end
end
# initialize an array of recipes to store the recipes made form the csv
# load from the csv each line and use it to create an instance of recipe

# https://kitt.lewagon.com/camps/1176/lectures/01-Ruby%2F06-Parsing#slides0
# putting it into the recipes array

# after this, add the add_recipe method and the all_recipe method

# when adding a recipe the to the cookbook we need to update the csv

# cookbook = Cookbook.new("lib/recipes.csv")
# p cookbook

# lasagna = Recipe.new("lasagna", "delicious")
# cookbook.create(lasagna)

# an instance of cookbook, with 2 instance variables (@csv, @recipes)
# @recipes will store 2 instances of recipe made from gthe csv
