
let rec mulByDigit i l =
  let f a x =
    let c = i * x in match a with | [] -> [] | h::t -> (h * i) mod 10 in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;
