class Alumno < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string, :required, :name => true
    email  :email_address, :required, :unique
    telefono :string
    timestamps
  end
  attr_accessible :nombre, :email, :telefono, :curso, :curso_id
  
  belongs_to :curso

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
