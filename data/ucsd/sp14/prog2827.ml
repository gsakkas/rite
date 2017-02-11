
let bigMul l1 l2 =
  let f a x = match a with | (i,acc) -> ([], acc) | _ -> failwith "wtf" in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;
