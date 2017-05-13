
let bigMul l1 l2 =
  let f a x =
    let (place,num) = a in
    let placement = 10 ** place in ((addit / 10), ((addit mod 10) :: num)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;
