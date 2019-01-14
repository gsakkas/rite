AppG (fromList [VarG,LamG EmptyG,LitG])
List.fold_left (fun a ->
                  fun x -> a + (x * x)) 0 xs
