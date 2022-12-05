defmodule StreamCsv.Data.Point do
  use Ecto.Schema
  import Ecto.Changeset

  schema "points" do
    field :name, :string
    field :value, :integer
  end

  @doc false
  def changeset(point, attrs) do
    point
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
