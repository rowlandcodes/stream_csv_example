defmodule StreamCsv.Repo.Migrations.CreatePoints do
  use Ecto.Migration

  def change do
    create table(:points) do
      add :name, :string
      add :value, :integer
    end
  end
end
