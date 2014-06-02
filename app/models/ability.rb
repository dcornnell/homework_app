class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
      if user.admin == "teacher"
        can :manage, [ Assignment, Cohort, Location, Course, Homework, Comment, Enrollment, User]
      else
        can [:read], [Homework, Comment, Cohort, Location, Assignment, User]
        can [:create], [Homework, Comment, Enrollment]
        can [:edit, :update], [Homework, Comment, Enrollment], :user_id => user.id
      end
  end
end
