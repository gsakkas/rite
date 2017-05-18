
let rec assoc (d,k,l) =
  match k with
  | h::t ->
      let (h1,h2) = h in if k = h2 then h1 else (h1, h2) :: (assoc (d, k, t))
  | _ -> d;;
