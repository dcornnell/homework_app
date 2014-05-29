class CohortsController <ApplicationController
	def new 
		@new_cohort = Cohort.new
	end

	def create 
		@new_cohort = Cohort.new(cohort_params)
		if @new_cohort.save
			redirect_to cohorts_path
		else
			render new_cohort_path, notice: "You Have Failed to add this cohort"
		end
	end
	def index
		@cohorts = Cohort.all
	end

	def show
		@cohort = Cohort.find(params[:id])
		
	end


	private

	def cohort_params
		params.require(:cohort).permit!
	end

	



end
