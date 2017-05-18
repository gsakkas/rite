
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let test = mulByDigit 1 [1; 0];;

let test = mulByDigit 1 [1; 0] List.rev test;;
