
let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = [a + x] in
    let base = List.hd l1 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
