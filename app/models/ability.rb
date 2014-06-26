class Ability
  include CanCan::Ability

  def initialize(user)
    
      user ||= User.new
      if user.role == "teacher"
        can :manage, [ Assignment, Cohort, Location, Course, Homework, Comment, Enrollment, User]
      else
        can [:read], [Homework, Comment, Cohort, Location, Assignment, User]
        can [:create], [Homework, Comment, Enrollment, User]
        can [:edit, :update], [Homework, Comment, Enrollment, User], :user_id => user.id
      end
  end
end
