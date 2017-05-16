
let bigMul l1 l2 =
  let f a x =
    let (m,n) = a in
    let (c,d) = x in let z = (c * d) + m in ((z / 10), ((z mod 10) :: n)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev ([0; 0; 0; 0] :: l1))
      (List.rev ([0; 0; 0; 0] :: l2)) in
  let (_,res) = List.fold_left f base args in res;;
