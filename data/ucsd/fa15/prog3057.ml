
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> (cout (hd, i)) @ (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;
