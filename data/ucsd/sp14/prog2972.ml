
let bigMul l1 l2 =
  let f a x = l1 in
  let base = ([], 1) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> (x, 0)
      | hd::tl -> List.append (x, hd) (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;
