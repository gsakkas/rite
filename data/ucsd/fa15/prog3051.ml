
let rec mulByDigit i l =
  let f a x = match x with | [] -> [] | h::t -> (i * h) / 10 in
  let base = i * h in
  let args = List.rev l in let res = List.fold_left base args in res;;
