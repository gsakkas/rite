
let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> acc
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let _ = mulByDigit - (9 [1; 2; 3]);;
