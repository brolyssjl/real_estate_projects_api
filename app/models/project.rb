class Project < ApplicationRecord
  validates :name, :country, :city, :neighborhood, :address,
            :phone, :description, :stratum,
            :sales_room_address, :sales_room_phone, :sales_room_email,
            :estimated_start_date, :estimated_end_date, presence: true
  validates :logo, presence: false, allow_blank: true
  # validates :sales_room_email, email: true
  validates :stratum, numericality: { only_integer: true }
end
