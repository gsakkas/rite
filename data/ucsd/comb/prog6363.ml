
let rec mulByDigit i l =
  let f a x =
    let (carry,acc) = a in
    let res = (x * i) + carry in ((res / 10), ((res mod 10) :: acc)) in
  let base = (0, []) in let args = List.rev in List.fold_left f base args;;
