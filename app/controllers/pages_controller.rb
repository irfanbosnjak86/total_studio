class PagesController < ApplicationController
  layout "application"
  layout "blog", only: [:about]

	def index
	end

	def about
	end
end
