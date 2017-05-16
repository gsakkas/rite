
let rec merge l1 l2 =
  match (l1, l2) with
  | ([],l) -> l
  | (l,[]) -> l
  | (h1::tl1,h2::tl2) ->
      if h1 < h2 then h1 :: (merge tl1 l2) else h2 :: (merge l1 tl2);;

let rec split l =
  let base = (0, [], []) in
  let fold_fn (i,l1,l2) elmt =
    if i < ((List.length l) / 2)
    then ((i + 1), (l1 @ [elmt]), l2)
    else (i, l1, (l2 @ [elmt])) in
  let (_,l1,l2) = List.fold_left fold_fn base l in (l1, l2);;

let rec merge_sort l =
  if List.length > 1 then let (l1,l2) = split l in merge l1 l2 else l;;
