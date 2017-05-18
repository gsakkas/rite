
let bigMul l1 l2 =
  let f a x = failwith "to be implemented" in
  let base = failwith "to be implemented" in
  let args =
    let rec argmaker x y =
      match y with | [] -> [] | hd::tl -> List.append (x, hd) (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;
