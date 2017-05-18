
let bigMul l1 l2 =
  let f a x = List.combine a x in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | hd::tl -> if tl = [] then [(x, hd)] else (x, hd) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;
