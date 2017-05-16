
let rec merge l1 l2 =
  match (l1, l2) with
  | ([],l) -> l
  | (l,[]) -> l
  | (h1::tl1,h2::tl2) ->
      if h1 < h2 then h1 :: ((merge tl1), tl2) else h2 :: ((merge tl1), tl2);;
