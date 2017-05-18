
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec bigMul l1 l2 =
  match l1 with | [] -> [] | h::t -> [mulByDigit h l2; bigMul (t, l2)];;
