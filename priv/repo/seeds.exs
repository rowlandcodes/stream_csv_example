StreamCsv.Repo.insert_all(
  StreamCsv.Data.Point,
  for(val <- 1..1000, do: %{name: "test", value: val})
)
