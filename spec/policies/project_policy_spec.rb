require 'rails_helper'
require 'spec_helper'

RSpec::Matchers.define :permit do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end

  failure_message_for_should do |policy|
    "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
  end

  failure_message_for_should_not do |policy|
    "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end

describe ProjectPolicy do
  subject {ProjectPolicy.new(user,project)}

  let(:project) { create :project }

  context 'for a visitor' do
    let(:user) { nil }

    it { should     permit(:show)    }

    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end

  context 'for a user' do
    let(:user) { FactoryGirl.create(:user) }

    it { should permit(:show)    }

    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:update)  }
    it { should_not permit(:edit)    }
    it { should_not permit(:destroy) }
  end

  context 'for a creative' do
    let(:user) { FactoryGirl.create(:creative_with_projects) }
    let(:project) {user.projects.first}

    it { should permit(:show)    }
    it { should permit(:create)  }
    it { should permit(:new)     }
    it { should permit(:update)  }
    it { should permit(:edit)    }
    it { should permit(:destroy) }
  end
end