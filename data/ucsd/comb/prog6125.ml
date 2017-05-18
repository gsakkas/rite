
let rec split l =
  let base = (0, [], []) in
  let fold_fn (i,l1,l2) elmt =
    if i < (l / 2)
    then ((i + 1), ([elmt] @ l1), l2)
    else (i, l1, ([elmt] @ l2)) in
  let (_,l1,l2) = List.fold_left fold_fn base l in (l1, l2);;
