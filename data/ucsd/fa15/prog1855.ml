
let add combined =
  let f a x =
    let (carry,accList) = a in
    let (x1,x2) = x in
    ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
  let base = (0, []) in List.fold_left f base List.rev combined;;
