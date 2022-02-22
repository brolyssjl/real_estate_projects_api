require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:neighborhood) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:stratum) }
  it { should validate_presence_of(:sales_room_address) }
  it { should validate_presence_of(:sales_room_phone) }
  it { should validate_presence_of(:sales_room_email) }
  it { should validate_presence_of(:estimated_start_date) }
  it { should validate_presence_of(:estimated_end_date) }
  it { should allow_value('').for(:logo) }
  it { should validate_numericality_of(:stratum).only_integer }
end
