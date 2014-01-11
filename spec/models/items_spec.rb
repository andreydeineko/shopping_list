require 'spec_helper'

describe Item do
  it { should belong_to(:user) }

  it { should validate_presence_of(:name)   }
  it { should validate_uniqueness_of(:name) }
end