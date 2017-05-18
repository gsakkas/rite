
let cin (x,y) = (x * y) / 10;;

let rec mulByDigit i l =
  let f a x =
    match x with | [] -> [] | h::t -> (cin (h, i)) @ (mulByDigit i t) in
  let base = i * h in
  let args = List.rev l in let res = List.fold_left base args in res;;
